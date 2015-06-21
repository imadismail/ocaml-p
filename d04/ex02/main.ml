(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 14:30:36 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/20 19:08:03 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec foreach cardlst f = match cardlst with
    | head::tail -> print_endline (f head); foreach tail f
    | _ -> ()

let main () =
    print_endline "foreach Card.allSpades (Card.toStringVerbose)";
    foreach Card.allSpades (Card.toStringVerbose);
    print_endline "print_endline (Card.toString(Card.best Card.allHearts))";
    print_endline (Card.toString(Card.best Card.allHearts));
    print_endline "Card.max (Card.newCard (Card.Value.King) (Card.Color.Diamond)) (Card.newCard (Card.Value.Jack) (Card.Color.Club)) ";
    print_endline (Card.toStringVerbose (Card.max (Card.newCard (Card.Value.King)
    (Card.Color.Diamond)) (Card.newCard (Card.Value.Jack) (Card.Color.Club))));
    print_endline "Card.isSpade(Card.newCard(Card.Value.T9)(Card.Color.Spade))";
    print_endline (string_of_bool(Card.isSpade(Card.newCard(Card.Value.T9)(Card.Color.Spade))));
    let newcard = Card.newCard(Card.Value.Queen)(Card.Color.Diamond) in
    print_string (Card.toStringVerbose newcard);
    print_string ("  " ^  (Card.Value.toStringVerbose (Card.getValue(newcard))));
    print_endline ("  " ^ (Card.Color.toStringVerbose (Card.getColor(newcard))))
let () = main ()
