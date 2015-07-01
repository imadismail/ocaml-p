(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/25 13:05:54 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/26 19:47:00 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () =
    let water = new Molecule_sub_class.water in
    let carbon_d = new Molecule_sub_class.carbon_dioxyde in
    let bicarbonate = new Molecule_sub_class.bicarbonate in
    let amidon = new Molecule_sub_class.amidon in
    let nylon = new Molecule_sub_class.nylon in
    let nylon2 = new Molecule_sub_class.nylon in
    let tartrazine = new Molecule_sub_class.tartrazine in
    let sexithiophene = new Molecule_sub_class.sexithiophene in
    let lucifer_yellow = new Molecule_sub_class.lucifer_yellow in
    print_endline water#to_string;
    print_endline carbon_d#to_string;
    print_endline bicarbonate#to_string;
    print_endline amidon#to_string;
    print_endline nylon#to_string;
    print_endline tartrazine#to_string;
    print_endline sexithiophene#to_string;
    print_endline lucifer_yellow#to_string;

    print_endline (string_of_bool (nylon#equals amidon));
    print_endline (string_of_bool (nylon#equals nylon2))
let () = main ()
