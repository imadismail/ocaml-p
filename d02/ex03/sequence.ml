(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   sequence.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/18 15:06:33 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/18 15:14:12 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec sequence n =
  let rec next str =
    let rec sub str i nbr =
      if (i < (String.length str) - 1 && str.[i] = str.[i + 1]) then sub str (i + 1) (nbr + 1)
      else if (i < (String.length str) - 1) then (string_of_int nbr)^(String.make 1 str.[i])^(sub str (i + 1) (1))
      else (string_of_int nbr)^(String.make 1 str.[i])
    in sub str 0 1
  in match n with
    | nbr when nbr > 0 -> next (sequence (n - 1))
    | nbr when nbr = 0 -> "1"
    | _ -> ""

let main () =
  print_string (sequence (-1)); print_char '\n';
  print_string (sequence 0); print_char '\n';
  print_string (sequence 1); print_char '\n';
  print_string (sequence 5); print_char '\n'

let () = main ()
