%{
    open Ast
    open Reducer
%}

%token Lambda
%token Dot
%token LParen
%token RParen
%token Equal
%token Semicolon
%token <string> Var
%token EOF

%token Colon
%token <bool> Boolvar
%token <int> Intvar
%token Arrow
%token IntT
%token BoolT
%token UnitT

%start <lc_expr> start

%type <lc_expr> program
%type <string * lc_expr> binding
%type <lc_expr> term
%type <lc_expr> application
%type <lc_expr> base

%%

start:
  | p = program; EOF; { p }

program:
  | t = term;                 { t }
  | b = binding; p = program; { let (n, v) = b in EApp (ELambda (n, (check_type v) , p), v) }

binding:
  | id = Var; Equal; t = term; Semicolon; { (id, t) }

typeterm:
  | IntT;          {IntTy}
  | BoolT;         {BoolTy}
  | UnitT;         {UnitTy}
  | t1 = typeterm; Arrow; t2 = typeterm;  { FuncTy (t1, t2) }
  | LParen; t = typeterm; RParen;     { t }

term:
  | Lambda; id = Var; Colon; ty = typeterm; Dot; t = term; { ELambda (id, ty, t) }
  | a = application;                 { a }

application:
  | a = application; b = base; { EApp (a, b) }
  | b = base;                  { b }

base:
  | LParen; RParen;           { EUnit }
  | iv = Intvar;               { EInt (iv) }
  | bv = Boolvar;              { EBool (bv) }
  | id = Var;                 { EVar id }
  | LParen; t = term; RParen; { t }

