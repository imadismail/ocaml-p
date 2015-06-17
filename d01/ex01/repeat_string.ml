(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_string.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 11:29:14 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/16 11:40:12 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let repeat_string ?(str="x") n =
    let empty = "" in
    let rec loop empty s c =
        let news  = empty ^ s in
        if c > 0
        then loop news s (c - 1)
        else empty
    in
    if n < 0
    then "Error"
    else loop empty str n

    (*
let main () =
    print_string (repeat_string (-1));
    print_char '\n';
    print_string (repeat_string 0);
    print_char '\n';
    print_string (repeat_string ~str:"Toto" 1);
    print_char '\n';
    print_string (repeat_string 2);
    print_char '\n';
    print_string (repeat_string ~str:"a" 5);
    print_char '\n';
    print_string (repeat_string ~str:"what" 3)

let () = main ()
*)
