(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Card.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 12:26:02 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/20 18:50:53 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module Color =
struct
    type t = Spade | Heart | Diamond | Club

    let all = [Spade;Heart;Diamond;Club]

    let toString = function
        | Spade -> "S"
        | Heart -> "H"
        | Diamond -> "D"
        | Club -> "C"

    let toStringVerbose = function
        | Spade -> "Spade"
        | Heart -> "Heart"
        | Diamond -> "Diamond"
        | Club -> "Club"
end

module Value =
struct
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
        | _ -> invalid_arg "out of bound/!\\"
        in
        next_i all 1
end

type t = (Value.t * Color.t)

let newCard vt ct = ((vt , ct):t)

let allColorCard color =
    let rec allv vallst cl = match vallst with
    | head::tail -> (newCard head cl) :: (allv tail cl)
    | _ -> []
    in
    let rec allc collst = match collst with
    | head::tail -> (allv Value.all head) :: (allc tail)
    | _ -> []
    in
    allc color

let allSpades    = List.flatten (allColorCard [Color.Spade])
let allHearts   = List.flatten (allColorCard [Color.Heart])
let allDiamonds = List.flatten (allColorCard [Color.Diamond])
let allClubs    = List.flatten (allColorCard [Color.Club])
let all         = List.flatten (allColorCard [Color.Spade;Color.Heart;Color.Diamond;Color.Club])


let toString = function
    | ((v, c):t) -> (Value.toString v ^ Color.toString c)

let toStringVerbose = function
    | ((v, c):t) -> ("Card(" ^ Value.toStringVerbose v ^ ", " ^ Color.toStringVerbose c ^ ")")

let getValue = function
    | ((v, c):t) -> v
let getColor = function
    | ((v, c):t) -> c

let compare t1 t2 =
    (Value.toInt(getValue t1)) - (Value.toInt(getValue t2))

let max t1 t2 =
    if compare t1 t2 >= 0 then t1 else t2

let min t1 t2 =
    if compare t1 t2 <= 0 then t1 else t2

let isOf t1 color =
    if (getColor t1) = color then true else false

let isSpade t1 =
    isOf t1 Color.Spade

let isHeart t1 =
    isOf t1 Color.Heart

let isDiamond t1 =
    isOf t1 Color.Diamond

let isClub t1 =
    isOf t1 Color.Club

let best = function
    | head::tail -> List.fold_left max head tail
    | _ -> invalid_arg "Empty List/!\\"
