(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   micronap.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 11:42:32 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/23 16:06:38 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let my_sleep () = Unix.sleep 1

let loop n =
    for i = 0 to (n - 1) do
        my_sleep ()
    done

let main () =
    if (Array.length Sys.argv) > 1 then 
            try loop (int_of_string (Sys.argv.(1))) with
            | _ -> ()
    else ()

let () = main ()

(*ocamlopt unix.cmxa micronap.ml*)
