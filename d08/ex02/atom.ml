(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   atom.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/25 12:35:16 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/25 15:44:58 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual atom name symbol atomic_number =
    object
        val _name:string         = name
        val _symbol:string       = symbol
        val _atomic_number:int   = atomic_number

        method name          = _name
        method symbol        = _symbol
        method atomic_number = _atomic_number

        method to_string         = "Name:"^_name^"\nSym: "^_symbol^"\nAN:  "
                                   ^ (string_of_int _atomic_number)
        method equals (a2:atom) = ((a2#atomic_number = _atomic_number)
        &&(a2#name = _name)&&(a2#symbol = _symbol))
    end
