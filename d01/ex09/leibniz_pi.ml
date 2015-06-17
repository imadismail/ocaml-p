(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   leibniz_pi.ml                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 17:09:30 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/16 18:43:39 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let leibniz_pi delta =
    let fabs flo =
        if flo < 0. then (-.flo) else flo
    in
    let rec loop i acc =
        if (fabs((4. *. (atan 1.)) -. (acc *. 4.))) <= delta
        then i
        else if (i mod 2) = 1
        then loop (i + 1) (acc +. ((-1.) /. ((2. *. (float_of_int i)) +. 1.)))
        else loop (i + 1) (acc +. (1. /. ((2. *. (float_of_int i)) +. 1.)))
    in
    if delta < 0 
    then (-1.)
    else loop 0 0.

let main () =
    print_int (leibniz_pi 0.0001);
    print_char '\n';
    print_int (leibniz_pi 0.001);
    print_char '\n';
    print_int (leibniz_pi 0.01);
    print_char '\n';
    print_int (leibniz_pi 0.1);
    print_char '\n';
    print_int (leibniz_pi 1.);
    print_char '\n';
    print_int (leibniz_pi (-1.))

let () = main ()
