(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   doctor.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/24 13:01:17 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/24 18:19:08 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class doctor =
    object (self)
        initializer print_endline ("Hello I'm the Doctor where my sonic screwdriver?")

        val _name:string        = "Doctor"
        val _age:int            = 2000
        val mutable _hp:int     = 100
        val _sidekick           = new People.people ("Dona Noble")

        method to_string        = ("Doctor class\nname:\t\t" ^ _name ^ "\nage: \t\t" ^
        (string_of_int _age) ^ "\nsidekick:\t" ^ _sidekick#to_string) ^
        "\nhp:  \t\t" ^ (string_of_int _hp)
        method talk             = print_endline ("Hi! I’m the Doctor!")

        method travel_in_time start arrival = print_endline 
        ("       =========================        \n"^
        "       =========================        \n"^
        "    ===============================     \n"^
        "+-------------------------------------+ \n"^
        "| +---------------------------------+ | \n"^
        "| | POLICE     PUBLIC CALL      BOX | | \n"^
        "| +---------------------------------+ | \n"^
        "+-------------------------------------+ \n"^
        "  | | +-----------+ +-----------+ | |   \n"^
        "  | | | +-------+ | | +-------+ | | |   \n"^
        "  | | | |  | |  | | | |  | |  | | | |   \n"^
        "  | | | |--+-+--| | | |--+-+--| | | |   \n"^
        "  | | | |--+-+--| | | |--+-+--| | | |   \n"^
        "  | | | |  | |  | | | |  | |  | | | |   \n"^
        "  | | | +-------+ | | +-------+ | | |   \n"^
        "  | | |           | |           | | |   \n"^
        "  | | | +-------+ | | +-------+ | | |   \n"^
        "  | | | | ~~~~~ | | | |       | | | |   \n"^
        "  | | | | ~~~~~ | | | |       | | | |   \n"^
        "  | | | | ~~~~~ | | | |       | | | |   \n"^
        "  | | | | ~~~~~ | | | |       | | | |   \n"^
        "  | | | +-------+ | | +-------+ | | |   \n"^
        "  | | |           | |           | | |   \n"^
        "  | | | +-------+ | | +-------+ | | |   \n"^
        "  | | | |       | | | |       | | | |   \n"^
        "  | | | | start | | | |arrival| | | |   \n"^
        "          " ^ (string_of_int start) ^
        "            " ^ (string_of_int arrival) ^ "\n" ^
        "  | | | |       | | | |       | | | |   \n"^
        "  | | | |       | | | |       | | | |   \n"^
        "  | | | +-------+ | | +-------+ | | |   \n"^
        "  | | |           | |           | | |   \n"^
        "  | | | +-------+ | | +-------+ | | |   \n"^
        "  | | | |       | | | |       | | | |   \n"^
        "  | | | |       | | | |       | | | |   \n"^
        "  | | | |       | | | |       | | | |   \n"^
        "  | | | |       | | | |       | | | |   \n"^
        "  | | | +-------+ | | +-------+ | | |   \n"^
        "  | | +-----------+ +-----------+ | |   \n"^
        "======================================= \n"^
        "======================================= \n")
    method use_sonic_screwdriver = print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"
    method private regenerate = _hp <- 100
    method fonction_test_regen = self#regenerate
    method fonction_test_dmg x = _hp <- (_hp - x)
    end
