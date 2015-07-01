(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   molecule_sub_class.ml                              :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/25 17:48:41 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/25 18:37:58 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec grp_atom typ n =
    if n > 0 then (Oo.copy typ) :: grp_atom typ (n - 1)
    else []

class water =
    object
        inherit Molecule.molecule "water"
        ((grp_atom new Atom_sub_class.hydrogen 2) @ [new Atom_sub_class.oxygen])
    end

class carbon_dioxyde =
    object
        inherit Molecule.molecule "carbon dioxyde"
        ([new Atom_sub_class.carbon] @(grp_atom new Atom_sub_class.oxygen 2))
    end

class bicarbonate =
    object
        inherit Molecule.molecule "bicarbonate"
        ([new Atom_sub_class.hydrogen;new Atom_sub_class.carbon]@(grp_atom new
        Atom_sub_class.oxygen 3))
    end

class amidon =
    object
        inherit Molecule.molecule "amidon" ((grp_atom new Atom_sub_class.hydrogen 10)
        @(grp_atom new Atom_sub_class.carbon 6)@(grp_atom new Atom_sub_class.oxygen 5))
    end

class nylon =
    object
        inherit Molecule.molecule "nylon" ((grp_atom new Atom_sub_class.hydrogen 22)
        @(grp_atom new Atom_sub_class.oxygen 2)@(grp_atom new Atom_sub_class.azote 2)
        @(grp_atom new Atom_sub_class.carbon 12))
    end

class tartrazine =
    object
        inherit Molecule.molecule "tartrazine" ((grp_atom new Atom_sub_class.hydrogen 9)
        @(grp_atom new Atom_sub_class.oxygen 9)@(grp_atom new Atom_sub_class.azote 4)
        @(grp_atom new Atom_sub_class.carbon 16)
        @(grp_atom new Atom_sub_class.soufre 2)@(grp_atom new Atom_sub_class.sodium 3))
    end
