(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   dalek.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/24 16:45:22 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/24 18:18:48 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class dalek =
    object
        val _name:string        = 
        ("Dalek" ^ (String.make 1 (char_of_int(Random.int 26 + 65)))^
        (String.make 1 (char_of_int(Random.int 26 + 65)))^
        (String.make 1 (char_of_int(Random.int 26 + 65))))

        val mutable _hp:int     = 100

        val mutable _shield:bool = true

        method to_string        =
        ("Dalek class\nname:\t" ^ _name ^ "\nhp:  \t" ^ (string_of_int _hp)
        ^ "\nsheild: " ^ (string_of_bool _shield))

        method talk = match (Random.int 4) with
        | 0 -> print_endline "Explain! Explain!"
        | 1 -> print_endline "Exterminate! Exterminate!"
        | 2 -> print_endline "I obey!"
        | _ -> print_endline "You are the Doctor! You are the enemy of the Daleks!"

        method exterminate (p:People.people) = p#die; _shield <- not _shield
        method die = print_endline "Emergency Temporal Shift!"; _hp <- 0
        method get_dmg x = _hp <- (_hp - x)
    end
