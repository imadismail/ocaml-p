(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_x.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 11:01:27 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/16 11:28:30 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let repeat_x x =
    let str = "" in
    let rec loop s c =
        let news  = s ^ "x" in
        if c > 0
        then loop news (c - 1)
        else s
    in
    if x < 0
    then "Error"
    else loop str x

    (*
let main () =
    print_string (repeat_x (-1));
    print_char '\n';
    print_string (repeat_x 0);
    print_char '\n';
    print_string (repeat_x 1);
    print_char '\n';
    print_string (repeat_x 2);
    print_char '\n';
    print_string (repeat_x 5)

let () = main ()
*)
