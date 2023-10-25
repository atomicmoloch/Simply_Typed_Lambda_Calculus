
(* The type of tokens. *)

type token = 
  | Var of (string)
  | UnitT
  | Semicolon
  | RParen
  | Lambda
  | LParen
  | Intvar of (int)
  | IntT
  | Equal
  | EOF
  | Dot
  | Colon
  | Boolvar of (bool)
  | BoolT
  | Arrow

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val start: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.lc_expr)
