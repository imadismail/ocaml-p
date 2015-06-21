(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 11:35:01 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/20 11:41:55 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () =
    let t = Color.all in
    let rec loop v = match v with
    | head::tail -> print_endline (Color.toString head);
    print_string (Color.toStringVerbose head); print_char '\n'; loop tail
    | _ -> ()
    in
    loop t

let () = main ()
