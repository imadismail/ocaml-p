(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_countdown.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 12:13:02 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/15 15:37:19 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_countdown nu =
    let rec count cd =
        if cd >= 0 then
            begin print_int cd  ; print_char '\n'; count (cd - 1) end
    in
    if nu < 0
    then
        begin print_int 0 ; print_char '\n' end
    else
        count nu
(*
let main () =
    begin
        print_string "ft_countdown 3\n" ; ft_countdown 3;
        print_string "ft_countdown 0\n" ; ft_countdown 0;
        print_string "ft_countdown -1\n" ; ft_countdown (-1);
        print_string "ft_countdown 10\n" ; ft_countdown 10;
    end
let () = main()
*)
