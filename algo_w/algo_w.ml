module Expr = Expr
module Infer = Infer

let parse_ty _str = failwith "Not implemented"

let parse_expr _str = failwith "Not implemented"

let parse_qual_pred _str = failwith "Not implemented"

let infer_ty ?(env = Infer.Env.empty) expr =
  try Ok (Infer.infer env expr) with
  | Infer.Type_error err -> Error err
