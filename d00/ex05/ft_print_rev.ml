(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_rev.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 15:10:06 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/15 15:50:06 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_rev str =
    let length = (String.length str) in
    let rec rev str i =
        if i > 0 then
            begin
                print_char (String.get str (i - 1));
                rev str (i - 1)
            end
    in
    rev str length;
    print_char '\n'
(*
let main () =
    print_string "ft_print_rev \"Hello world !\"\n";
    ft_print_rev "Hello world !";
    print_string "ft_print_rev \"\"\n";
    ft_print_rev "";
    print_string "ft_print_rev \"abcdefghijklmnopqrstuvwxyz\"\n";
    ft_print_rev "abcdefghijklmnopqrstuvwxyz"

let () = main ()
*)
