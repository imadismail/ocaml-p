(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   examples_of_file.ml                                :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 16:15:31 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/22 19:32:16 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


(*split sur c*)
let strSplit str c =
    let strlen = String.length str in
    let rec loop start len =
        if len + start = strlen then [(String.sub str start len)]
        else if (str.[len + start]) = c
        then ((String.sub str start len) :: (loop (start + len + 1) 1))
        else loop start (len + 1)
    in
    loop 0 1

(*String -> (float Array * String)*)
let lst_to_tuple lst =
    try
    let len = List.length lst in
    let farray = Array.make (len - 1) 0. in
    let rec loop acc i = match acc with
    | head::tail when i < (len - 1) -> Array.set farray i (float_of_string head); loop tail (i + 1)
    | head::_ -> (farray, head)
    | _ -> (farray, "")
    in
    loop lst 0
    with
    |_ -> ([|0.|],"")


(*in_channel -> string*)
let file_to_string ic =
    let rec loop lst =
        try
            let c = [input_line ic] in
            loop (( @ ) lst  c)
        with
        | End_of_file -> lst
        | _ -> lst
    in
    loop []

(*string list -> (float Array * string) list*)
let rec file_to_tuple lst = match lst with
        | head::tail -> (lst_to_tuple (strSplit head ',')) :: (file_to_tuple tail)
        | _ -> []


(*string -> (float array * string) list*)
let examples_of_files file_name =
    try
    let ic = open_in file_name in
    let lst_to_tuple = file_to_tuple (file_to_string ic) in
    lst_to_tuple
    with
    | _ -> []


let depilea array =
    let len = Array.length array - 1 in
    for i = 0 to len do
        print_float array.(i);print_string "|"
    done

let depilet tuple = match tuple with
| (f,a) -> print_string "float-> [|";depilea f;print_string "] -> string "; print_endline a


let rec depilel lst = match lst with
| head::tail -> depilet head; depilel tail
| _ -> ()

let main () =
    if Array.length Sys.argv > 1
    then depilel (examples_of_files Sys.argv.(1))
    else print_endline ""

let () = main ()
