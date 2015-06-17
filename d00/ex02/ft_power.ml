(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_power.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 12:41:19 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/15 15:41:47 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ft_power n p =
    if p > 0
    then n * ft_power n (p - 1)
    else 1
(*
let main () =
    begin
        print_string "ft_power 2 4\n"; print_int (ft_power 2 4);
        print_char '\n';
        print_string "ft_power 3 0\n"; print_int(ft_power 3 0);
        print_char '\n';
        print_string "ft_power 0 5\n"; print_int(ft_power 0 5);
        print_char '\n'
    end

let () = main ()
*)
