(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   helix.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/18 20:05:06 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/18 21:16:18 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


type phosphate = string
type deoxyribose = string
type nucleobase = A | T | C | G | None
type nucleotide = phosphate * deoxyribose * nucleobase
type helix = nucleotide list

let get_nuc_base_char n = match n with
    | 'A' -> A
    | 'T' -> T
    | 'C' -> C
    | 'G' -> G
    | _ -> None

let get_nuc_base_int n = match n with
    | 0 -> A
    | 1 -> T
    | 2 -> C
    | 3 -> G
    | _ -> None

let get_nucleobase nuc = match nuc with
    | A -> "A"
    | T -> "T"
    | C -> "C"
    | G -> "G"
    | _ -> "None"


let print_nucleo n =
    match n with
    | pho, deo, nuc -> print_string pho ; print_char ' ' ;
    print_string deo ; print_char ' ' ; print_string (get_nucleobase nuc) ;
    print_char '\n'

let generate_nucleotide_int c = match c with
    |  _  -> ((("phosphate":phosphate), ("deodeoxyribose":deoxyribose),
    (get_nuc_base_int c)):nucleotide)


let generate_nucleotide_char c = match c with
    |  _  -> ((("phosphate":phosphate), ("deodeoxyribose":deoxyribose),
    (get_nuc_base_char c)):nucleotide)

let get_revers_nucleobase nuc = match nuc with
    | A -> 'T'
    | T -> 'A'
    | C -> 'G'
    | G -> 'C'
    | _ -> ' '

let revers_helix n = match n with
    | pho, deo, nuc -> (generate_nucleotide_char (get_revers_nucleobase nuc))


let complementary_helix helix =
    let rec loop hel cm_helix = match hel with
    | head::tail -> loop (tail:helix) (( @ )cm_helix  (([revers_helix head]):helix))
    | _ -> (cm_helix:helix)
    in
    loop helix ([]:helix)

let rec helix_to_string h =
    let get_nucleobase_name nuc = match nuc with
    | A -> 'A'
    | T -> 'T'
    | C -> 'C'
    | G -> 'G'
    | _ -> ' '
    in match (h:helix) with
    | (p, d, n) :: l -> p ^ " " ^ d ^ " " ^
    (String.make 1 (get_nucleobase_name n)) ^ ", " ^
    helix_to_string l
    | [] -> ""

let generate_helix n =
    Random.self_init ();
    let rec gene len lst =
        if len = 0 then lst
        else (gene (len - 1) ((generate_nucleotide_int (Random.int 4)) :: lst))
    in
    gene n ([]:helix)

let main () =
    let l = generate_helix 5 in
    let l2 = complementary_helix l in
    print_string (helix_to_string l);
    print_char '\n';
    print_string (helix_to_string l2)

let () = main ()
