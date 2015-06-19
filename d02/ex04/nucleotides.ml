(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   nucleotides.ml                                     :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/18 14:56:12 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/18 20:02:13 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type phosphate = string
type deoxyribose = string
type nucleobase = A | T | C | G | None
type nucleotide = phosphate * deoxyribose * nucleobase

let get_nuc_base n = match n with
    | 'A' -> A
    | 'T' -> T
    | 'C' -> C
    | 'G' -> G
    | _ -> None

let get_nucleobase nuc = match nuc with
    | A -> "A"
    | T -> "T"
    | C -> "C"
    | G -> "G"
    | _ -> "None"

let generate_nucleotide c = match c with
|  _  -> ((("phosphate":phosphate), ("deodeoxyribose":deoxyribose), (get_nuc_base c)):nucleotide)

let print_nucleo n =
    match n with
    | pho, deo, nuc -> print_string pho ; print_char ' ' ;
    print_string deo ; print_char ' ' ; print_string (get_nucleobase nuc) ;
    print_char '\n'

let main ()=
    print_nucleo (generate_nucleotide 'A');
    print_nucleo (generate_nucleotide 'T');
    print_nucleo (generate_nucleotide 'C');
    print_nucleo (generate_nucleotide 'G');
    print_nucleo (generate_nucleotide 'Y')

let () = main ()
