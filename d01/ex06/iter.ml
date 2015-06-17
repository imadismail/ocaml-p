(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   iter.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 14:46:02 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/16 16:04:53 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec iter f x n =
    if n < 0 then -1
    else
        if n = 0 then x
        else iter (f) (f x) (n - 1)

let main () =
    print_int (iter (fun x -> x * x) 2 (-42));
    print_char '\n';
    print_int (iter (fun x -> x * x) 2 4);
    print_char '\n';
    print_int (iter (fun x -> x * 2) 2 4);
    print_char '\n'

let () = main ()
