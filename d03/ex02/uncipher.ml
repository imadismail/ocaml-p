(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   uncipher.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/19 15:36:06 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/19 19:29:09 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let unrot42 str =
    let is_a c =
        c >= 'a' && c <= 'z' in
    let is_A c =
        c >= 'A' && c <= 'Z' in
    let rec rot_n c =
        if is_a c then (char_of_int ((((int_of_char (c) -97) + 10) mod 26) + 97))
        else
            begin
                if is_A c then (char_of_int ((((int_of_char (c) -65) + 10 ) mod 26) + 65))
                else c
            end
    in
    String.map (rot_n) str


let uncaesar str i =
    let is_a c =
        c >= 'a' && c <= 'z' in
    let is_A c =
        c >= 'A' && c <= 'Z' in
    let rec rot_n c =
        if is_a c then (char_of_int ((((int_of_char (c) -97) + (26 - (i mod 26))) mod 26) + 97))
        else
            begin
                if is_A c then (char_of_int ((((int_of_char (c) -65) + (26 - (i mod 26))) mod 26) + 65))
                else c
            end
    in
    String.map rot_n str

let xor str i =
    let rot_n c =
        char_of_int ((lxor) (int_of_char c) i)
    in
    String.map rot_n str

let uncaesar_like str =
    uncaesar str 42

let xor_like str =
    xor str 42

let rec ft_uncrypt str flst = match flst with
| head::tail -> ft_uncrypt (head str) tail
| _-> str


let main () =
    let lst = [uncaesar_like;xor_like;unrot42] in
    print_string (ft_uncrypt "F_\n\\@kORUB@" lst)

let () = main ()
