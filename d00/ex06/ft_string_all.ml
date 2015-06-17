(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_string_all.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 15:24:17 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/15 16:56:48 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


let ft_string_all f str =
    let length = String.length str in
    let rec loop f str i =
        if (i > 0)
        then begin
            if f (String.get str (i -1 ))
            then loop f str (i - 1)
            else false
         end
        else true
    in
    loop f str length
(*
let is_digit c = c >= '0' && c <= '9'

let test f str =
 if ft_string_all f str
    then print_string "True\n"
    else print_string "False\n"


let main () =
    print_string "ft_string_all \"0123456789\"\n" ;
    test is_digit "0123456789";
    print_string "ft_string_all \"0123456789Q\"\n" ;
    test is_digit "0123456789Q";
let () = main ()
*)
