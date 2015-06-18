(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   encode.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/17 13:50:53 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/17 17:44:43 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec cat l1 l2 = match l1 with
  | h::t -> h :: (cat t l2)
  | [] -> l2

let encode alist =
  let rec hash list n out = match list with
    | e1::e2::l when e1 = e2 -> hash (e2::l) (n + 1) out
    | e1::e2::l -> hash (e2::l) 1 (cat out [(n, e1)])
    | e1::l -> hash l 1 (cat out [(n, e1)])
    | _ -> out
  in
    hash alist 1 []

let main () =
  let rec print_encode list = match list with
    | (n, v) :: l -> print_int n ; print_string v ; print_char ' ' ; print_encode l
    | [] -> print_char '\n'
  in print_encode (encode ["S"; "a"; "a"; "l"; "u"; "u"; "u"; "t"]) ;
     print_encode (encode ["A"; "B"]);
     print_encode (encode ["A"]);
     print_encode (encode [])

let () = main ()
