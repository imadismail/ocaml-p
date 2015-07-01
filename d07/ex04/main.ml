(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/24 12:13:38 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/24 20:08:16 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec for_each ar = match ar with
| head::tail -> print_endline head#to_string; for_each tail
    | _ -> ()

let rec die_chain ar = match ar with
| head:: tail -> head#die; die_chain tail
| _ -> ()

let main () =
    Random.self_init ();
    let gg = (new Galifrey.galifrey) in
    gg#add_dalek;
    gg#add_dalek;
    gg#add_dalek;
    gg#add_doctor;
    gg#add_doctor;
    gg#add_doctor;
    gg#add_people ("Clara");
    gg#add_people ("Petass aleatoir");
    gg#add_people ("Ocaml <> language cool");
    gg#do_time_war;
    for_each gg#get_dalek#get_ar;
    for_each gg#get_doctor#get_ar;
    for_each gg#get_people#get_ar;
    die_chain gg#get_dalek#get_ar;
    die_chain gg#get_people#get_ar

let () = main ()
