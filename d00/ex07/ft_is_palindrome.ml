(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_is_palindrome.ml                                :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 16:46:40 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/15 17:13:10 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_is_palindrome str =
    let length = (String.length str / 2) in
    let rec loop str length current =
        if current <> length then
            begin
                if (String.get str current) = (String.get str ((String.length str) - current - 1))
                then
                    loop str length (current + 1)
                else false
            end
                else
                    true
    in
    loop str length 0
(*
let main () =
    print_string "ft_is_palindrome \"radar\"\n";
    if ft_is_palindrome "radar"
    then print_string "True\n"
    else print_string "False\n";
    print_string "ft_is_palindrome \"madam\"\n";
    if ft_is_palindrome "madam"
    then print_string "True\n"
    else print_string "False\n";
    print_string "ft_is_palindrome \"car\"\n";
    if ft_is_palindrome "car"
    then print_string "True\n"
    else print_string "False\n";
    print_string "ft_is_palindrome \"\"\n";
    if ft_is_palindrome ""
    then print_string "True\n"
    else print_string "False\n";
    print_string "ft_is_palindrome \"o\"\n";
    if ft_is_palindrome "o"
    then print_string "True\n"
    else print_string "False\n";
    print_string "ft_is_palindrome \"j aime le jambon\"\n";
    if ft_is_palindrome "j aime le jambon\n"
    then print_string "True\n"
    else print_string "False\n"

let () = main ()
*)
