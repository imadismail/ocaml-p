(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   alkanes.ml                                         :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/25 18:45:19 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/26 20:16:13 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec grp_atom typ n =
    if n > 0 then (Oo.copy typ) :: grp_atom typ (n - 1)
    else []

let get_alkane = function
    | 1 -> "methane"
    | 2 -> "ethane"
    | 3 -> "propane"
    | 4 -> "butane"
    | 5 -> "pentane"
    | 6 -> "hexane"
    | 7 -> "heptane"
    | 8 -> "octane"
    | 9 -> "nonane"
    | 10 -> "decane"
    | 11 -> "undecane"
    | 12 -> "dodecane"
    | 13 -> "tridecane"
    | 14 -> "tetradecane"
    | 15 -> "pentadecane"
    | 16 -> "cetane"
    | 17 -> "heptadecane"
    | 18 -> "octadecane"
    | 19 -> "nonadecane"
    | 20 -> "eicosane"
    | 21 -> "heneicosane"
    | 22 -> "docosane"
    | 23 -> "tricosane"
    | 24 -> "tetracosane"
    | 25 -> "pentacosane"
    | 26 -> "hexacosane"
    | 27 -> "heptacosane"
    | 28 -> "octacosane"
    | 29 -> "nonacosane"
    | 30 -> "triacontane"
    | 31 -> "untriacontane"
    | 32 -> "dotriacontane"
    | 33 -> "tritriacontane"
    | 34 -> "tetratriacontane"
    | 35 -> "pentatriacontane"
    | 36 -> "hexatriacontane"
    | 37 -> "heptatriacontane"
    | 38 -> "octatriacontane"
    | 39 -> "nonatriacontane"
    | 40 -> "tetracontane"
    | _ -> "you-fucking-kidding-me-ane"


let get_alkane_elem n =
    ((grp_atom new Atom_sub_class.carbon n)@(grp_atom new
    Atom_sub_class.hydrogen ((2 * n) + 2)))

class virtual alkanes n =
    object
    inherit Molecule.molecule (get_alkane n) (get_alkane_elem n)
end
