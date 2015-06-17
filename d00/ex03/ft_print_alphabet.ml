(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_alphabet.ml                               :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 13:06:02 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/15 15:42:46 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_alphabet () =
    let chara = int_of_char 'a' in
    let charz = int_of_char 'z' in
    let rec loop current =
        if current <= charz 
        then begin
        print_char (char_of_int current);
        loop (current + 1) end
    in
    loop chara;
    print_char '\n'

(*
let main () =
    ft_print_alphabet()

let () = main()
*)
