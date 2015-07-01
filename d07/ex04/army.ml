(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   army.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/24 18:33:37 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/24 20:08:19 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class ['a] army (x:'a) =
    object
        val mutable _ar = x::[]

        method get_ar = _ar
        method add x = _ar <- (( @ ) _ar [x])
        method delete = _ar <- match _ar with | head::tail -> tail | _ -> []
    end
