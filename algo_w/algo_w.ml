module Expr = Expr
module Infer = Infer


let parse_ty str =
  let lexbuf = Lexing.from_string str in
  Parser.qual_ty_forall_eof Lexer.token lexbuf

let parse_expr str =
  let lexbuf = Lexing.from_string str in
  Parser.expr_eof Lexer.token lexbuf

let parse_qual_pred str =
  let lexbuf = Lexing.from_string str in
  Parser.qual_pred_eof Lexer.token lexbuf

let infer_ty ?(env = Infer.Env.empty) expr =
  try Ok (Infer.infer env expr) with
  | Infer.Type_error err -> Error err
