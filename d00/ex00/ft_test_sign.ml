(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_test_sign.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 11:24:59 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/15 15:34:38 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_test_sign(nu) =
    if nu < 0
    then print_string("negative\n")
    else print_string("positive\n")
(*
let main () =
    begin
    print_string "42\n"; ft_test_sign 42;
    print_string "0\n"; ft_test_sign 0;
    print_string "-42\n"; ft_test_sign (-42);
    end

let () = main()
*)
