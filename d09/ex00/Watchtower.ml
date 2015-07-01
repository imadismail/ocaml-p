(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Watchtower.ml                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/26 14:23:50 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/26 15:10:42 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module Watchtower =
    struct
type hour = int
let zero = (0:hour)
let add (h1:hour) (h2:hour) =
    if h1 + h2 < 0
    then (((((h1 + h2) mod 12) + 12) mod 12):hour)
    else (((h1 + h2) mod 12):hour)
let sub (h1:hour) (h2:hour) = 
    if h1 - h2 < 0
    then (((((h1 - h2) mod 12) + 12) mod 12):hour)
    else (((h1 - h2) mod 12):hour)
    end
