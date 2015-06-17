(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   hofstadter_mf.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 13:31:15 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/16 13:41:05 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec hfs_f n =
    if n < 0 then (-1)
    else
        if n = 0 then 1
        else n - hfs_m (hfs_f (n - 1))

and hfs_m n =
    if n < 0 then (-1)
    else
        if n = 0 then 0
        else n - hfs_f (hfs_m (n - 1))

let main () =

print_int (hfs_m (-1));
print_char '\n';
print_int (hfs_f (-1));
print_char '\n';
print_char '\n';
print_int (hfs_m 0);
print_char '\n';
print_int (hfs_f 0);
print_char '\n';
print_int (hfs_m 4);
print_char '\n';
print_int (hfs_f 4);
print_char '\n'

let () = main ()
