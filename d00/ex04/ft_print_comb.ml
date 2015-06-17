(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_comb.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 13:19:11 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/15 15:43:43 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_comb() =
    let rec comb i j k =
        print_int i ; print_int j ; print_int k;
        if (i <> 7) then
            begin
                print_string ", ";
                if (j == 8) then comb (i + 1) (i + 2) k
                else begin
                    if (k == 9) then comb i (j + 1) (j + 2)
                    else begin
                        comb i j (k + 1)
            end
                    end
                end
    in
    comb 0 1 2;
    print_string "\n"
(*
let main () =
    ft_print_comb ()

let () = main ()
*)
