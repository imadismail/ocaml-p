(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_graphics.ml                                     :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/18 11:16:58 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/19 15:34:43 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a tree = Nil | Node of 'a * 'a tree * 'a tree

let draw_square x y size =
    let rx = x -(size/2) in
    let ry = y -(size/2) in
    Graphics.moveto rx ry;
    Graphics.lineto (rx+size) ry;
    Graphics.lineto (rx+size) (ry+size);
    Graphics.lineto rx (ry+size);
    Graphics.lineto rx ry

let rec size tree = match tree with
| Node (v, g, d) -> 1 + (size g) + (size d)
| Nil -> 0

let maxime i j =
if i > j then i
else j

let height tree =
    let rec get_height tree max i = match tree with
    | Node (v,g,d) when i > max -> maxime (get_height g (max + 1) (i + 1)) (get_height d (max + 1) (i + 1))
    | Node (v,g,d) -> maxime (get_height g max (i + 1)) (get_height d max (i + 1))
    | Nil when i > (max + 1) -> i
    | Nil -> max
    in get_height tree 0 0

let draw_tree tree =
    let rec draw x y node = 
    Graphics.moveto x y;
     match node with
    | Node (n1, n2, n3) -> Graphics.draw_string n1;
    draw_square (x + 2) (y + 6) 20;
    Graphics.moveto (x + 2) (y + 18); Graphics.lineto (x - 20) (y + 44);
    draw (x - 20)  (y + 50) n2;
    Graphics.moveto (x + 2) (y + 18); Graphics.lineto (x + 50) (y + 44);
    draw (x + 50) (y + 50) n3
    | Nil -> Graphics.draw_string "Nil"; draw_square (x + 2) (y + 6) 20
    in
    draw 200 4 tree

let test tree =
    draw_tree tree;
    Graphics.moveto 10 200;
    Graphics.draw_string "size:";
    Graphics.moveto 60 200;
    Graphics.draw_string (string_of_int (size tree));
    Graphics.moveto 10 170;
    Graphics.draw_string "height:";
    Graphics.moveto 60 170;
    Graphics.draw_string (string_of_int (height tree));
    Graphics.read_key ()

let main () =
    Graphics.open_graph " 400x400";
    (*test (Nil)*)
    (*test (Node("mdr", Nil, Nil))*)
    (*test (Node("mdr", Node("mdr", Nil, Nil), Nil))*)
    (*test (Node("mdr", Nil, Node("mdr", Nil, Nil)));*)
    test (Node("mdr", Node("mdr", Nil, Nil), Node("mdr", Nil, Nil)))
    (*test (Node("mdr", Node("mdr", Node("mdr", Nil, Nil), Node("mdr", Nil,
    Nil)), Node("mdr", Node("mdr", Nil, Nil), Node("mdr", Nil, Nil))))*)

let () =
    ignore(main ());
    print_endline ""
