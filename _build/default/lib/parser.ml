
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | Var of (
# 12 "lib/parser.mly"
       (string)
# 15 "lib/parser.ml"
  )
    | UnitT
    | Semicolon
    | RParen
    | Lambda
    | LParen
    | Intvar of (
# 17 "lib/parser.mly"
       (int)
# 25 "lib/parser.ml"
  )
    | IntT
    | Equal
    | EOF
    | Dot
    | Colon
    | Boolvar of (
# 16 "lib/parser.mly"
       (bool)
# 35 "lib/parser.ml"
  )
    | BoolT
    | Arrow
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
    open Ast
    open Reducer

# 49 "lib/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_start) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: start. *)

  | MenhirState02 : (('s, _menhir_box_start) _menhir_cell1_Var, _menhir_box_start) _menhir_state
    (** State 02.
        Stack shape : Var.
        Start symbol: start. *)

  | MenhirState06 : (('s, _menhir_box_start) _menhir_cell1_Lambda _menhir_cell0_Var, _menhir_box_start) _menhir_state
    (** State 06.
        Stack shape : Lambda Var.
        Start symbol: start. *)

  | MenhirState08 : (('s, _menhir_box_start) _menhir_cell1_LParen, _menhir_box_start) _menhir_state
    (** State 08.
        Stack shape : LParen.
        Start symbol: start. *)

  | MenhirState13 : (('s, _menhir_box_start) _menhir_cell1_typeterm, _menhir_box_start) _menhir_state
    (** State 13.
        Stack shape : typeterm.
        Start symbol: start. *)

  | MenhirState16 : ((('s, _menhir_box_start) _menhir_cell1_Lambda _menhir_cell0_Var, _menhir_box_start) _menhir_cell1_typeterm, _menhir_box_start) _menhir_state
    (** State 16.
        Stack shape : Lambda Var typeterm.
        Start symbol: start. *)

  | MenhirState17 : (('s, _menhir_box_start) _menhir_cell1_LParen, _menhir_box_start) _menhir_state
    (** State 17.
        Stack shape : LParen.
        Start symbol: start. *)

  | MenhirState24 : (('s, _menhir_box_start) _menhir_cell1_application, _menhir_box_start) _menhir_state
    (** State 24.
        Stack shape : application.
        Start symbol: start. *)

  | MenhirState33 : (('s, _menhir_box_start) _menhir_cell1_binding, _menhir_box_start) _menhir_state
    (** State 33.
        Stack shape : binding.
        Start symbol: start. *)


and ('s, 'r) _menhir_cell1_application = 
  | MenhirCell1_application of 's * ('s, 'r) _menhir_state * (Ast.lc_expr)

and ('s, 'r) _menhir_cell1_binding = 
  | MenhirCell1_binding of 's * ('s, 'r) _menhir_state * (string * Ast.lc_expr)

and ('s, 'r) _menhir_cell1_typeterm = 
  | MenhirCell1_typeterm of 's * ('s, 'r) _menhir_state * (Ast.typ)

and ('s, 'r) _menhir_cell1_LParen = 
  | MenhirCell1_LParen of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_Lambda = 
  | MenhirCell1_Lambda of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_Var = 
  | MenhirCell1_Var of 's * ('s, 'r) _menhir_state * (
# 12 "lib/parser.mly"
       (string)
# 117 "lib/parser.ml"
)

and 's _menhir_cell0_Var = 
  | MenhirCell0_Var of 's * (
# 12 "lib/parser.mly"
       (string)
# 124 "lib/parser.ml"
)

and _menhir_box_start = 
  | MenhirBox_start of (Ast.lc_expr) [@@unboxed]

let _menhir_action_01 =
  fun a b ->
    (
# 55 "lib/parser.mly"
                               ( EApp (a, b) )
# 135 "lib/parser.ml"
     : (Ast.lc_expr))

let _menhir_action_02 =
  fun b ->
    (
# 56 "lib/parser.mly"
                               ( b )
# 143 "lib/parser.ml"
     : (Ast.lc_expr))

let _menhir_action_03 =
  fun () ->
    (
# 59 "lib/parser.mly"
                              ( EUnit )
# 151 "lib/parser.ml"
     : (Ast.lc_expr))

let _menhir_action_04 =
  fun iv ->
    (
# 60 "lib/parser.mly"
                               ( EInt (iv) )
# 159 "lib/parser.ml"
     : (Ast.lc_expr))

let _menhir_action_05 =
  fun bv ->
    (
# 61 "lib/parser.mly"
                               ( EBool (bv) )
# 167 "lib/parser.ml"
     : (Ast.lc_expr))

let _menhir_action_06 =
  fun id ->
    (
# 62 "lib/parser.mly"
                              ( EVar id )
# 175 "lib/parser.ml"
     : (Ast.lc_expr))

let _menhir_action_07 =
  fun t ->
    (
# 63 "lib/parser.mly"
                              ( t )
# 183 "lib/parser.ml"
     : (Ast.lc_expr))

let _menhir_action_08 =
  fun id t ->
    (
# 41 "lib/parser.mly"
                                          ( (id, t) )
# 191 "lib/parser.ml"
     : (string * Ast.lc_expr))

let _menhir_action_09 =
  fun t ->
    (
# 37 "lib/parser.mly"
                              ( t )
# 199 "lib/parser.ml"
     : (Ast.lc_expr))

let _menhir_action_10 =
  fun b p ->
    (
# 38 "lib/parser.mly"
                              ( let (n, v) = b in EApp (ELambda (n, (check_type v) , p), v) )
# 207 "lib/parser.ml"
     : (Ast.lc_expr))

let _menhir_action_11 =
  fun p ->
    (
# 34 "lib/parser.mly"
                      ( p )
# 215 "lib/parser.ml"
     : (Ast.lc_expr))

let _menhir_action_12 =
  fun id t ty ->
    (
# 51 "lib/parser.mly"
                                                           ( ELambda (id, ty, t) )
# 223 "lib/parser.ml"
     : (Ast.lc_expr))

let _menhir_action_13 =
  fun a ->
    (
# 52 "lib/parser.mly"
                                     ( a )
# 231 "lib/parser.ml"
     : (Ast.lc_expr))

let _menhir_action_14 =
  fun () ->
    (
# 44 "lib/parser.mly"
                   (IntTy)
# 239 "lib/parser.ml"
     : (Ast.typ))

let _menhir_action_15 =
  fun () ->
    (
# 45 "lib/parser.mly"
                   (BoolTy)
# 247 "lib/parser.ml"
     : (Ast.typ))

let _menhir_action_16 =
  fun () ->
    (
# 46 "lib/parser.mly"
                   (UnitTy)
# 255 "lib/parser.ml"
     : (Ast.typ))

let _menhir_action_17 =
  fun t1 t2 ->
    (
# 47 "lib/parser.mly"
                                          ( FuncTy (t1, t2) )
# 263 "lib/parser.ml"
     : (Ast.typ))

let _menhir_action_18 =
  fun t ->
    (
# 48 "lib/parser.mly"
                                      ( t )
# 271 "lib/parser.ml"
     : (Ast.typ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | Arrow ->
        "Arrow"
    | BoolT ->
        "BoolT"
    | Boolvar _ ->
        "Boolvar"
    | Colon ->
        "Colon"
    | Dot ->
        "Dot"
    | EOF ->
        "EOF"
    | Equal ->
        "Equal"
    | IntT ->
        "IntT"
    | Intvar _ ->
        "Intvar"
    | LParen ->
        "LParen"
    | Lambda ->
        "Lambda"
    | RParen ->
        "RParen"
    | Semicolon ->
        "Semicolon"
    | UnitT ->
        "UnitT"
    | Var _ ->
        "Var"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_31 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_start =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let p = _v in
          let _v = _menhir_action_11 p in
          MenhirBox_start _v
      | _ ->
          _eRR ()
  
  let rec _menhir_goto_program : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _ -> _menhir_box_start =
    fun _menhir_stack _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState33 ->
          _menhir_run_34 _menhir_stack _v _tok
      | MenhirState00 ->
          _menhir_run_31 _menhir_stack _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_34 : type  ttv_stack. (ttv_stack, _menhir_box_start) _menhir_cell1_binding -> _ -> _ -> _menhir_box_start =
    fun _menhir_stack _v _tok ->
      let MenhirCell1_binding (_menhir_stack, _menhir_s, b) = _menhir_stack in
      let p = _v in
      let _v = _menhir_action_10 b p in
      _menhir_goto_program _menhir_stack _v _menhir_s _tok
  
  let _menhir_run_29 : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _ -> _menhir_box_start =
    fun _menhir_stack _v _menhir_s _tok ->
      let t = _v in
      let _v = _menhir_action_09 t in
      _menhir_goto_program _menhir_stack _v _menhir_s _tok
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Equal ->
          let _menhir_stack = MenhirCell1_Var (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState02 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Var _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lambda ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LParen ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | Intvar _v ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Boolvar _v ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | Boolvar _ | EOF | Intvar _ | LParen | Var _ ->
          let id = _v in
          let _v = _menhir_action_06 id in
          _menhir_goto_base _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let id = _v in
      let _v = _menhir_action_06 id in
      _menhir_goto_base _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_base : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _ -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState33 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState02 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_25 : type  ttv_stack. (ttv_stack, _menhir_box_start) _menhir_cell1_application -> _ -> _ -> _ -> _ -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_application (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_01 a b in
      _menhir_goto_application _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_application : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _ -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Var _v_0 ->
          let _menhir_stack = MenhirCell1_application (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState24
      | LParen ->
          let _menhir_stack = MenhirCell1_application (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | Intvar _v_1 ->
          let _menhir_stack = MenhirCell1_application (_menhir_stack, _menhir_s, _v) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState24
      | Boolvar _v_2 ->
          let _menhir_stack = MenhirCell1_application (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState24
      | EOF | RParen | Semicolon ->
          let a = _v in
          let _v = _menhir_action_13 a in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Var _v ->
          let _menhir_stack = MenhirCell1_LParen (_menhir_stack, _menhir_s) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17
      | RParen ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_goto_base _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | Lambda ->
          let _menhir_stack = MenhirCell1_LParen (_menhir_stack, _menhir_s) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | LParen ->
          let _menhir_stack = MenhirCell1_LParen (_menhir_stack, _menhir_s) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | Intvar _v ->
          let _menhir_stack = MenhirCell1_LParen (_menhir_stack, _menhir_s) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17
      | Boolvar _v ->
          let _menhir_stack = MenhirCell1_LParen (_menhir_stack, _menhir_s) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_Lambda (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Var _v ->
          let _menhir_stack = MenhirCell0_Var (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Colon ->
              let _menhir_s = MenhirState06 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UnitT ->
                  _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LParen ->
                  _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IntT ->
                  _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | BoolT ->
                  _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_16 () in
      _menhir_goto_typeterm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_typeterm : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _ -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState06 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState08 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_15 : type  ttv_stack. ((ttv_stack, _menhir_box_start) _menhir_cell1_Lambda _menhir_cell0_Var as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_start) _menhir_state -> _ -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typeterm (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Dot ->
          let _menhir_s = MenhirState16 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Var _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lambda ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LParen ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | Intvar _v ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Boolvar _v ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | Arrow ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let iv = _v in
      let _v = _menhir_action_04 iv in
      _menhir_goto_base _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_20 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let bv = _v in
      let _v = _menhir_action_05 bv in
      _menhir_goto_base _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_13 : type  ttv_stack. (ttv_stack, _menhir_box_start) _menhir_cell1_typeterm -> _ -> _ -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState13 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UnitT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LParen ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IntT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BoolT ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LParen (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState08 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UnitT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LParen ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IntT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BoolT ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_14 () in
      _menhir_goto_typeterm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_15 () in
      _menhir_goto_typeterm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_14 : type  ttv_stack. ((ttv_stack, _menhir_box_start) _menhir_cell1_typeterm as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_start) _menhir_state -> _ -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Arrow ->
          let _menhir_stack = MenhirCell1_typeterm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | Dot | RParen ->
          let MenhirCell1_typeterm (_menhir_stack, _menhir_s, t1) = _menhir_stack in
          let t2 = _v in
          let _v = _menhir_action_17 t1 t2 in
          _menhir_goto_typeterm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. ((ttv_stack, _menhir_box_start) _menhir_cell1_LParen as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_start) _menhir_state -> _ -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RParen ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LParen (_menhir_stack, _menhir_s) = _menhir_stack in
          let t = _v in
          let _v = _menhir_action_18 t in
          _menhir_goto_typeterm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | Arrow ->
          let _menhir_stack = MenhirCell1_typeterm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_goto_term : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _ -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState33 ->
          _menhir_run_29 _menhir_stack _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_29 _menhir_stack _v _menhir_s _tok
      | MenhirState02 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState16 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState17 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_27 : type  ttv_stack. (ttv_stack, _menhir_box_start) _menhir_cell1_Var -> _ -> _ -> _ -> _ -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | Semicolon ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_Var (_menhir_stack, _menhir_s, id) = _menhir_stack in
          let t = _v in
          let _v = _menhir_action_08 id t in
          let _menhir_stack = MenhirCell1_binding (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | Var _v_0 ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState33
          | Lambda ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
          | LParen ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
          | Intvar _v_1 ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState33
          | Boolvar _v_2 ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState33
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack. ((ttv_stack, _menhir_box_start) _menhir_cell1_Lambda _menhir_cell0_Var, _menhir_box_start) _menhir_cell1_typeterm -> _ -> _ -> _ -> _ -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_typeterm (_menhir_stack, _, ty) = _menhir_stack in
      let MenhirCell0_Var (_menhir_stack, id) = _menhir_stack in
      let MenhirCell1_Lambda (_menhir_stack, _menhir_s) = _menhir_stack in
      let t = _v in
      let _v = _menhir_action_12 id t ty in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_21 : type  ttv_stack. (ttv_stack, _menhir_box_start) _menhir_cell1_LParen -> _ -> _ -> _ -> _ -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RParen ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LParen (_menhir_stack, _menhir_s) = _menhir_stack in
          let t = _v in
          let _v = _menhir_action_07 t in
          _menhir_goto_base _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_start) _menhir_state -> _ -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let b = _v in
      let _v = _menhir_action_02 b in
      _menhir_goto_application _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState00 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Var _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lambda ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LParen ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Intvar _v ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Boolvar _v ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
end

let start =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_start v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
