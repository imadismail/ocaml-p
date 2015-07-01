(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   jokes.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 13:58:04 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/22 14:24:44 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let jokes = [|"Funny jokes";"Variable == ref";"ocaml is cool";"href=\"http://jokes.cc.com/\"";"Unit == Void"|]

let main () =
    Random.self_init ();
    print_endline (jokes.(Random.int 5))

let () = main ()
