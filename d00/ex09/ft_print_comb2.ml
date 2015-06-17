(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_comb2.ml                                  :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 18:45:24 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/15 19:00:26 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_comb2 () =
    let rec loop i j =
        if i < 10 then print_char '0'; print_int i;
        print_char ' ';
        if j < 10 then print_char '0'; print_int j;
        if (i <> 98)
        then
            begin
                print_char ',';
                print_char ' ';
                if j = 99
                then loop (i + 1) (i + 2)
                else loop i (j + 1)
            end
    in
    loop 0 1;
    print_char '\n'

(*
let () = ft_print_comb2 ()
*)
