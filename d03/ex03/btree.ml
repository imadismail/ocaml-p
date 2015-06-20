(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   btree.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/19 20:06:10 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/19 20:06:17 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a tree = Nil | Node of 'a * 'a tree * 'a tree

let rec is_bst tree =
  let is_greater value node = match node with
	| Nil -> true
	| Node(v, _, _) when v < value -> true
	| _ -> false
  in let is_lower value node = match node with
	| Nil -> true
	| Node(v, _, _) when v > value -> true
	| _ -> false
  in match tree with
	 | Node(v, s1, s2) when (is_greater v s1) && (is_lower v s2) && (is_bst s1) && (is_bst s2) -> true
	 | Nil -> true
	 |  _  -> false

let rec height tree =
  let max a b = if a > b then a else b
  in let rec sub tree = match tree with
	   | Nil -> -1
	   | Node(v, s1, s2) -> 1 + max (sub s1) (sub s2)
	 in if (tree = Nil) then 0 else sub tree

let rec is_balanced tree = match tree with
  | Node(_, s1, s2) when height s1 = height s2 && is_balanced s1 && is_balanced s2 -> true
  | Nil -> true
  |  _  -> false

let is_perfect tree =
  let rec leaf_nbr tree = match tree with
	| Nil -> 1
	| Node (_, s1, s2) -> (leaf_nbr s1) + (leaf_nbr s2)
  in let pow i j =
	   let rec pow_rec x y acc =
		 if y = 0 then acc
		 else pow_rec x (y - 1) (x * acc)
	   in pow_rec i j i
	 in if tree = Nil || (is_balanced tree && (pow 2 (height tree) = leaf_nbr tree)) then true else false

let rec search_bst value tree = match tree with
  | Node(v, s1, s2) when v = value || search_bst value s1 || search_bst value s2 -> true
  | _ -> false

(* """""""""""" Tests """""""""""" *)

let test_search_bst () =
  print_string (string_of_bool (search_bst 1 (Nil))); print_char '\n';
  print_string (string_of_bool (search_bst 2 (Node(1, Nil, Nil)))); print_char '\n';
  print_string (string_of_bool (search_bst 2 (Node(1, Node(2, Nil, Nil), Node(3, Nil, Nil))))); print_char '\n';
  print_string (string_of_bool (search_bst 2 (Node(1, Node(2, Nil, Nil), Nil)))); print_char '\n';
  print_string (string_of_bool (search_bst 42 (Node(1, Node(2, Node(3, Nil, Nil), Node(4, Nil, Nil)), Node(5, Nil, Nil))))); print_char '\n';
  print_string (string_of_bool (search_bst 5 (Node(1, Node(2, Node(3, Nil, Nil), Node(4, Nil, Nil)), Node(5, Nil, Nil))))); print_char '\n'

let test_is_perfect () =
  print_string (string_of_bool (is_perfect (Nil))); print_char '\n';
  print_string (string_of_bool (is_perfect (Node(1, Nil, Nil)))); print_char '\n';
  print_string (string_of_bool (is_perfect (Node(1, Node(1, Nil, Nil), Node(1, Nil, Nil))))); print_char '\n';
  print_string (string_of_bool (is_perfect (Node(1, Node(1, Nil, Nil), Nil)))); print_char '\n';
  print_string (string_of_bool (is_perfect (Node(1, Node(1, Node(1, Nil, Nil), Node(1, Nil, Nil)), Node(1, Nil, Nil))))); print_char '\n'

let test_is_bst() =
  print_string (string_of_bool (is_bst (Nil))); print_char '\n';
  print_string (string_of_bool (is_bst (Node(1, Nil, Nil)))); print_char '\n';
  print_string (string_of_bool (is_bst (Node(5, Node(3, Nil, Nil), Node(7, Nil, Nil))))); print_char '\n';
  print_string (string_of_bool (is_bst (Node(5, Node(2, Node(1, Nil, Nil), Node(3, Nil, Nil)), Node(7, Node(6, Nil, Nil), Node(8, Nil, Nil)))))); print_char '\n';
  print_string (string_of_bool (is_bst (Node(5, Node(7, Nil, Nil), Node(5, Nil, Nil))))); print_char '\n';
  print_string (string_of_bool (is_bst (Node(5, Node(4, Node(1, Nil, Nil), Node(3, Nil, Nil)), Node(7, Node(6, Nil, Nil), Node(8, Nil, Nil)))))); print_char '\n'


let main () =
  test_is_bst(); print_char '\n';
  test_is_perfect(); print_char '\n';
  test_search_bst(); print_char '\n'

let () = main ()
