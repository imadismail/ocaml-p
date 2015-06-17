(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   tak.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 12:18:40 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/16 12:28:41 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec tak x y z =
    if y < x
    then
        tak (tak(x - 1) y z) (tak (y - 1) z x) (tak (z - 1) x y)
    else z

(*
let main () =
    print_int (tak 1 2 3);
    print_char '\n';
    print_int (tak 5 23 7);
    print_char '\n';
    print_int (tak 9 1 0);
    print_char '\n';
    print_int (tak 1 1 1);
    print_char '\n';
    print_int (tak 0 42 0);
    print_char '\n';
    print_int (tak 23498 98734 98776)

let () = main ()
*)
