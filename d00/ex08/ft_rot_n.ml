(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_rot_n.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 17:22:27 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/15 18:32:41 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)




let ft_rot_n i str =
    let is_a c =
        c >= 'a' && c <= 'z' in
    let is_A c =
        c >= 'A' && c <= 'Z' in
    let rec rot_n c =
        if is_a c then (char_of_int ((((int_of_char (c) -97) + i) mod 26) + 97))
        else
            begin
                if is_A c then (char_of_int ((((int_of_char (c) -65) + i) mod 26) + 65))
                else c
            end
    in
    String.map (rot_n) str
(*
let main () =
    print_string (ft_rot_n 1 "abcdefghijklmnopqrstuvwxyz\n");
    print_string (ft_rot_n 27 "abcdefghijklmnopqrstuvwxyz\n");
    print_string (ft_rot_n 13 "abcdefghijklmnopqrstuvwxyz\n");
    print_string (ft_rot_n 3 "bob\n");
    print_string (ft_rot_n 42 "abcdefghijklmnopqrstuvwxyz\n")

let () = main ()
*)
