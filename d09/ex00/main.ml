(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/26 14:34:00 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/26 15:10:41 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () =
    let clock = Watchtower.Watchtower.zero in
    print_endline (string_of_int clock);
    print_endline (string_of_int (Watchtower.Watchtower.add clock (1:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.add clock (2:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.add clock (3:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.add clock (4:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.add clock (5:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.add clock (6:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.add clock (7:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.add clock (8:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.add clock (9:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.add clock (10:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.add clock (11:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.add clock (12:Watchtower.Watchtower.hour)));
    print_endline "";
    print_endline (string_of_int (Watchtower.Watchtower.sub clock (1:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.sub clock (2:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.sub clock (3:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.sub clock (4:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.sub clock (5:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.sub clock (6:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.sub clock (7:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.sub clock (8:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.sub clock (9:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.sub clock (10:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.sub clock (11:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.sub clock (12:Watchtower.Watchtower.hour)));
    print_endline "";
    print_endline (string_of_int (Watchtower.Watchtower.sub clock ((-42):Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.add clock ((-42):Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.sub clock (42:Watchtower.Watchtower.hour)));
    print_endline (string_of_int (Watchtower.Watchtower.add clock (42:Watchtower.Watchtower.hour)))

let () = main ()
