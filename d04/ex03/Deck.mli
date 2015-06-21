(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Deck.mli                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 19:44:55 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/20 20:40:30 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module Card :
  sig
    module Color :
      sig
        type t
        val all : t list
        val toString : t -> string
        val toStringVerbose : t -> string
      end
    module Value :
      sig
        type t
        val all : t list
        val toInt : t -> int
        val toString : t -> string
        val toStringVerbose : t -> string
        val next : t -> t
        val previous : t -> t
      end
    type t = Value.t * Color.t
    val newCard : Value.t -> Color.t -> t
    val allColorCard : Color.t list -> t list list
    val allSpades : t list
    val allHearts : t list
    val allDiamonds : t list
    val allClubs : t list
    val all : t list
    val toString : t -> string
    val toStringVerbose : t -> string
    val getValue : t -> Value.t
    val getColor : t -> Color.t
    val compare : t -> t -> int
    val max : t -> t -> t
    val min : t -> t -> t
    val isOf : t -> Color.t -> bool
    val isSpade : t -> bool
    val isHeart : t -> bool
    val isDiamond : t -> bool
    val isClub : t -> bool
    val best : t list -> t
  end
type t = Card.t list
val newDeck : t
val toStringListVerbose : t -> string list
val toStringList : t -> string list
val drawCard : Card.t list -> Card.t * t
