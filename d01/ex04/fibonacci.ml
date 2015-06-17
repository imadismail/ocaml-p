(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   fibonacci.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 12:29:57 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/16 13:30:24 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let fibonacci n =
    let rec fib_aux n first second =
        if n > 0
        then fib_aux (n - 1) second (first + second)
        else first
    in
    if n < 0
    then -1
    else fib_aux n 0 1

let main () =
    print_int (fibonacci 0);
    print_char '\n';

    print_int (fibonacci 1);
    print_char '\n';

    print_int (fibonacci 2);
    print_char '\n';

    print_int (fibonacci 3);
    print_char '\n';

    print_int (fibonacci 4);
    print_char '\n';

    print_int (fibonacci 12);
    print_char '\n'
let () = main ()
