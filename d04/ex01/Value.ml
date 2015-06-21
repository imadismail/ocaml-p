(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Value.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 11:43:16 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/20 15:10:33 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As

let all = [T2 ; T3 ; T4 ; T5 ; T6 ; T7 ; T8 ; T9 ; T10 ; Jack ; Queen ; King ; As]

let toInt = function
    | T2    -> 1
    | T3    -> 2
    | T4    -> 3
    | T5    -> 4
    | T6    -> 5
    | T7    -> 6
    | T8    -> 7
    | T9    -> 8
    | T10   -> 9
    | Jack  -> 10
    | Queen -> 11
    | King  -> 12
    | As    -> 13

let toString = function
    | T2    -> "2"
    | T3    -> "3"
    | T4    -> "4"
    | T5    -> "5"
    | T6    -> "6"
    | T7    -> "7"
    | T8    -> "8"
    | T9    -> "9"
    | T10   -> "10"
    | Jack  -> "J"
    | Queen -> "Q"
    | King  -> "K"
    | As    -> "A"

let toStringVerbose = function
    | T2    -> "2"
    | T3    -> "3"
    | T4    -> "4"
    | T5    -> "5"
    | T6    -> "6"
    | T7    -> "7"
    | T8    -> "8"
    | T9    -> "9"
    | T10   -> "10"
    | Jack  -> "Jack"
    | Queen -> "Queen"
    | King  -> "King"
    | As    -> "As"

let next t =
    let nu = (toInt t) + 1 in
    let rec next_i lst n = match lst with
    | head::tail when nu = n -> head
    | head::tail -> next_i tail (n + 1)
    | _ -> invalid_arg "out of bound"
    in
    next_i all 1
let previous t =
    let nu = (toInt t) - 1 in
    let rec next_i lst n = match lst with
    | head::tail when nu = n -> head
    | head::tail -> next_i tail (n + 1)
    | _ -> invalid_arg "out of bound"
    in
    next_i all 1
