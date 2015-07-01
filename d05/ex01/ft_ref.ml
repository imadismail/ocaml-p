(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_ref.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 12:26:08 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/23 16:55:45 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a ft_ref = { mutable content : 'a }

let return x = { content = x }
let set r x = r.content <- x
let get x = x.content
let bind r f = return (f (r.content)).content


let funtest x =
    return (float_of_int x)

let main () =
    (*******return*******)
    let x = return 10 in
    print_int x.content; print_char '\n';

    (*********set********)
    set x 5;
    print_int x.content; print_char '\n';

    (*********bind********)
    let d = bind x (funtest) in

    (*********get********)
    let i = get d in
    print_float i


let () = main ()
