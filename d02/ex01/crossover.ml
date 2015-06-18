(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   crossover.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/17 14:50:56 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/17 17:45:20 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec cat l1 l2 = match l1 with
  | h::t -> h :: (cat t l2)
  | [] -> l2

let crossover l1 l2 =
  let rec isInList x list = match list with
    | head::tail -> (x = head) || (isInList x tail)
    | _ -> false
  in
  let rec found list1 list2 out = match list1 with
    | h::t when ((isInList h list2) && (isInList h out) = false) -> (found t list2 (( @ ) out [h]))
    | h::t -> found t list2 out
    | _ -> out
  in
    found l1 l2 []

let rec print_cross l = match l with
  | h::t -> print_char h; print_char '\n' ;print_cross t
  | _ -> print_char '\n'

let main () =
  print_cross (crossover ['1';'2';'5';'3';'4';'5'] ['1';'7';'8';'5';'5']);
  print_char '\n';

  print_cross (crossover ['1';'2';'5';'3';'4';'5'] []);
  print_char '\n';

  print_cross (crossover [] ['1';'7';'8';'5';'5']);
  print_char '\n';

  print_cross (crossover ['7'] ['1';'7';'8';'5';'5']);
  print_char '\n'
let () = main ()
