(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/24 12:13:38 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/25 20:43:28 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec for_each ar = match ar with
| head::tail -> print_endline head#to_string; for_each tail
    | _ -> ()

let main () =
    Random.self_init ();
    let army = (new Army.army (new People.people "Dona Noble")) in
    let army2 = (new Army.army (new Dalek.dalek)) in
    let army3 = (new Army.army (new Doctor.doctor)) in
    print_endline "people test";
    for_each army#get_ar;
    print_endline "";

    army#add (new People.people "Clara");
    for_each army#get_ar;
    print_endline "";

    army#delete;
    for_each army#get_ar;

    print_endline "\ndalek test";
    for_each army2#get_ar;
    print_endline "";

    army2#add (new Dalek.dalek);
    for_each army2#get_ar;
    print_endline "";

    army2#delete;
    for_each army2#get_ar;
    print_endline "";
    army3#add (new Doctor.doctor);
    army3#add (new Doctor.doctor);
    army3#add (new Doctor.doctor);
    army3#add (new Doctor.doctor);
    for_each army3#get_ar
let () = main ()
