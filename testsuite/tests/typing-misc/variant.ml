(* TEST
   * expect
*)

(* PR#6394 *)

module rec X : sig
 type t = int * bool
end = struct
 type t = A | B
 let f = function A | B -> 0
end;;
[%%expect{|
Line 3, characters 6-61:
  ......struct
   type t = A | B
   let f = function A | B -> 0
  end..
Error: Signature mismatch:
       Modules do not match:
         sig type t = X.t = A | B val f : t -> int end
       is not included in
         sig type t = int * bool end
       Type declarations do not match:
         type t = X.t = A | B
       is not included in
         type t = int * bool
|}];;
