(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   jokes.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 13:58:04 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/23 16:59:41 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let fill ic len =
    let tab = Array.make len "" in
    try
        for i = 0 to len do
            Array.set tab i (input_line ic)
        done;
    with
    | End_of_file -> print_endline (tab.(Random.int len))
    | _ -> ()

let file () =
    let file_name = "jokes.blague" in
    try
        let ic = open_in file_name in
        let len = int_of_string (input_line ic) in
        fill ic len
    with
    | Sys_error err -> print_endline (file_name ^ ": No such file or directory")
    | _ -> ()

let main () =
    Random.self_init ();
    file ()

let () = main ()
