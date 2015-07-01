(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   eu_dist.ml                                         :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 15:04:42 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/22 15:26:35 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let eu_dist a b =
    let n = (Array.length a) - 1 in
    if n <> ((Array.length b) - 1) 
    then invalid_arg "invalid_arg"
    else
    let ret = ref 0. in
    for i = 0 to n do
        ret := (!ret +. ((a.(i) -. b.(i)) *. (a.(i) -. b.(i))))
    done;
    sqrt !ret

let main () =
    print_float (eu_dist [|1.; 2.; 3.; 4.12|] [|7.; 6.;65.; (-7.)|]);
    print_char '\n'

let () = main ()

