(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 20:02:57 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/20 20:13:10 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec foreach cardlst = match cardlst with
    | head::tail -> print_endline head; foreach tail
    | _ -> ()

let main () =
    let deck = Deck.newDeck in
    foreach (Deck.toStringListVerbose(deck));
    let pick = Deck.drawCard deck in
    let getReCkT = function
        | (card, newDeck) -> foreach (Deck.toStringList newDeck) ;
        print_endline ( Deck.Card.toStringVerbose card)
     in
     getReCkT pick
let () = main ()
