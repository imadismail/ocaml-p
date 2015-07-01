(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/25 13:05:54 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/26 19:33:59 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec for_each lst = match lst with
|head::tail -> print_endline head#to_string;for_each tail
|_ -> ()

let main () =
    let h = new Atom_sub_class.hydrogen in
    let c = new Atom_sub_class.carbon in
    let o = new Atom_sub_class.oxygen in
    let ar = new Atom_sub_class.argon in
    let al = new Atom_sub_class.aluminium in
    let hg = new Atom_sub_class.mercure in
    let i = new Atom_sub_class.iode in
    let co = new Atom_sub_class.cobalt in
    let he = new Atom_sub_class.helium in
    let n = new Atom_sub_class.azote in
    let f = new Atom_sub_class.fluor in
    let na = new Atom_sub_class.sodium in
    let s = new Atom_sub_class.soufre in

    let lst = [h;c;o;ar;al;hg;i;co;he;n;f;na;s] in
    for_each lst;
    print_endline (string_of_bool(h#equals co));
    print_endline (string_of_bool(he#equals he))
let () = main ()
