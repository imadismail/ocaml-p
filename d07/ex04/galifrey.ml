(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   galifrey.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/24 19:49:20 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/24 20:08:18 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class galifrey =
    object
        val _dalek  = (new Army.army (new Dalek.dalek))
        val _doctor = (new Army.army (new Doctor.doctor))
        val _people = (new Army.army (new People.people "Dona Noble"))

        method do_time_war = print_endline  "Launch the greatest battle in time and space."

        method add_dalek  = _dalek#add (new Dalek.dalek)
        method add_doctor = _doctor#add (new Doctor.doctor)
        method add_people x = _people#add (new People.people x)

        method get_dalek = _dalek
        method get_doctor = _doctor
        method get_people = _people
    end

