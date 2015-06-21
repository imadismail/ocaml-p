(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 12:04:37 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/20 12:12:47 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () =
    let t = Value.all in
    let rec loop v = match v with
    | head::tail -> print_string (Value.toString head);print_char ' ';
    print_string (Value.toStringVerbose head); print_char '\n'; loop tail
    | _ -> ()
    in
    loop t;
    print_char '\n';
    print_string (Value.toStringVerbose (Value.next Value.T2));
    print_char '\n';
    print_string (Value.toStringVerbose (Value.previous Value.As));
    print_char '\n';
    print_string (Value.toStringVerbose (Value.previous Value.T2))

let () = main ()
