(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   cipher.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/19 15:36:03 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/19 19:28:55 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


let rot42 str =
    let is_a c =
        c >= 'a' && c <= 'z' in
    let is_A c =
        c >= 'A' && c <= 'Z' in
    let rot_n c =
        if is_a c then (char_of_int ((((int_of_char (c) -97) + 16) mod 26) + 97))
        else
            begin
                if is_A c then (char_of_int ((((int_of_char (c) -65) + 16) mod 26) + 65))
                else c
            end
    in
    String.map (rot_n) str

let caesar str i =
    let is_a c =
        c >= 'a' && c <= 'z' in
    let is_A c =
        c >= 'A' && c <= 'Z' in
    let rot_n c =
        if is_a c then (char_of_int ((((int_of_char (c) -97) + i) mod 26) + 97))
        else
            begin
                if is_A c then (char_of_int ((((int_of_char (c) -65) + i) mod 26) + 65))
                else c
            end
    in
    String.map rot_n str

let xor str i =
    let rot_n c =
        char_of_int ((lxor) (int_of_char c) i)
    in
    String.map rot_n str

let caesar_like str =
    caesar str 42

let xor_like str =
    xor str 42

let rec ft_crypt str flst = match flst with
| head::tail -> ft_crypt (head str) tail
| _-> str


let main () =
    let lst = [caesar_like;xor_like;rot42] in
    print_string (ft_crypt "je ft_crypt" lst)

let () = main ()

