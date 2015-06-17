(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_sum.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 15:49:10 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/16 17:59:27 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_sum f x y =
    let rec for_each f n acc =
        if n > y then acc
        else for_each (f) (n + 1) (acc +. (f n))
    in
     if (y - x) < 0 then (-1.)
     else for_each f x 0.

let main () =
    print_float (ft_sum (fun i -> float_of_int (i * i)) 1 10);
    print_char '\n'

let () = main ()
