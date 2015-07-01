(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   people.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/24 12:13:40 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/25 20:34:45 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class people name =
    object
        initializer print_endline ("Hello I'm " ^ name ^ " what the name of the Doctor?")

        val _name:string    = name
        val mutable _hp:int = 100

        method to_string    = ("People class\nname:\t" ^ _name ^ "\nhp:  \t" ^ (string_of_int _hp))
        method talk         = print_endline ("I'm " ^ _name ^ "! Do you know the Doctor?")
        method die          = print_endline ("Aaaarghh!"); _hp <- 0
    end
