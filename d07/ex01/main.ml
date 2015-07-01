(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/24 12:13:38 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/24 18:30:20 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () =
    let f = (new Doctor.doctor) in
    f#talk;
    print_endline f#to_string;
    f#travel_in_time 1 20;
    f#use_sonic_screwdriver;
    f#fonction_test_dmg 10;
    print_endline f#to_string;
    f#fonction_test_regen;
    print_endline f#to_string

let () = main ()
