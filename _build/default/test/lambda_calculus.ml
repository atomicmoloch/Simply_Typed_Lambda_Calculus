open OUnit2
open Lambda_calculus.Lexer
open Lambda_calculus.Ast
open Lambda_calculus.Reducer
open Lambda_calculus.Parser



let _ = [
print_string ("\n t1 :" ^ typ_to_str (check_type(parse "1"))),
print_string ("\n t2 :" ^ typ_to_str (check_type(parse "(&x:int. &x:bool. x)"))),
print_string ("\n t3 :" ^ typ_to_str (check_type(parse "(&x:int. &x:bool. x) 1"))),
print_string ("\n t4 :" ^ typ_to_str (check_type(parse "(&x:unit. x) ()")))
];;
