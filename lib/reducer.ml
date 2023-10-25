open Ast

let next_var = ref 0

let fresh_var (_ : unit) : string =
  let () = next_var := !next_var + 1 in
  "x$" ^ string_of_int !next_var

let rec free_in (x : string) : lc_expr -> bool = function
  | EVar s -> s = x
  | ELambda (p,_, b) -> p <> x && free_in x b
  | EApp (e1, e2) -> free_in x e1 || free_in x e2

let rec sub (x : string) (v : lc_expr) : lc_expr -> lc_expr = function
  | EVar y -> if y = x then v else EVar y
  | EApp (e1, e2) -> EApp (sub x v e1, sub x v e2)
  | ELambda (p,t, b) as expr ->
    if p = x then expr
    else if free_in p v then sub x v (alpha_rename expr)
    else ELambda (p, t, sub x v b)
and alpha_rename : lc_expr -> lc_expr = function
  | ELambda (p, t, b) ->
    let f = fresh_var () in
    ELambda (f, t, sub p (EVar f) b)
  | expr -> expr

let rec irr : lc_expr -> bool = function
  | EVar _ -> true
  | EApp (EApp (t1, t2), t3) -> irr (EApp (t1, t2)) && irr t3
  | EApp (EVar _, t) -> irr t
  | ELambda (_, _, t) -> irr t
  | _ -> false

let rec reduction_step : lc_expr -> lc_expr = function
  | EApp (ELambda (x,_ , t), s) -> sub x s t
  | ELambda (x, ty, t) -> ELambda (x, ty, reduction_step t)
  | EApp (t1, t2) ->
    if irr t1
    then EApp (t1, reduction_step t2)
    else EApp (reduction_step t1, t2)
  | t -> failwith ("Irreducible term in reduction_step " ^ print_lc_expr t)

let rec reduce ?(verbose : bool = false) (expr : lc_expr) : lc_expr =
  if irr expr
  then expr
  else
    let () = if verbose then print_endline (print_lc_expr expr) else () in
    reduce ~verbose:verbose (reduction_step expr)

let check_type (e : lc_expr) : typ =
  let rec ctypehelper (ex : lc_expr) (vars : (string * typ) list) = (
    match ex with
    | EInt _ -> IntTy
    | EBool _ -> BoolTy
    | EUnit _ -> UnitTy
    | EVar s -> (match List.assoc_opt s vars with
      | None -> raise (TypeError ("Unbound variable " ^ s))
      | Some f -> f)
    | EApp (l1, l2) -> (match (ctypehelper l1 vars) with
      | FuncTy (t1, t2) -> (match (ctypehelper l2 vars) with
        | t1 -> t2
        | x -> raise (TypeError ("Expected " ^ typ_to_str t1 ^ ", got " ^ typ_to_str x))      )
      | x -> raise (TypeError ("Expected form type -> type, got " ^ typ_to_str x))
    )
    | ELambda (s, t, l) -> let t2 = (ctypehelper l ((s, t) :: vars)) in FuncTy (t, t2)
  ) in ctypehelper e []
