(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   converges.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 14:57:35 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/16 15:46:17 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec converges f x n =
    if n < 0
        then false
    else if x = (f x)
        then true
    else if n = 0
         then false
    else converges f (f x) (n - 1)

let main () =
    if converges (( * ) 2) 2 5
    then print_string "true\n"
    else print_string "false\n";

    if converges (fun x -> x / 2) 2 3
    then print_string "true\n"
    else print_string "false\n";

    if converges (fun x -> x / 2) 2 2
    then print_string "true\n"
    else print_string "false\n"

let () = main()
