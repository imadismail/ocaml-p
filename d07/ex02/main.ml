(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/24 12:13:38 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/24 18:17:22 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () =
    Random.self_init ();
    let dal = (new Dalek.dalek) in
    let doc = (new Doctor.doctor) in
    dal#talk;
    doc#talk;
    print_endline dal#to_string; print_endline "";
    print_endline doc#to_string;
    doc#use_sonic_screwdriver;
    dal#get_dmg 20;
    dal#exterminate doc#get_people;
    print_endline dal#to_string; print_endline "";
    doc#use_sonic_screwdriver;
    dal#die
let () = main ()
