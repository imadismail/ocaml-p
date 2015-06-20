(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_graphics.ml                                     :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/18 11:16:58 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/19 13:45:02 by lguarda          ###   ########.fr       *)
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

let draw_tree_node tree =
    let rec draw x y node = 
    Graphics.moveto x y;
     match node with
    | Node (n1, n2, n3) -> Graphics.draw_string  (string_of_int n1);
    draw_square (x + 2) (y + 6) 20;
    Graphics.moveto (x + 2) (y + 18); Graphics.lineto (x - 20) (y + 44);
    draw (x - 20)  (y + 50) n2;
    Graphics.moveto (x + 2) (y + 18); Graphics.lineto (x + 20) (y + 44);
    draw (x + 20) (y + 50) n3
    | Nil -> Graphics.draw_string "Nil"; draw_square (x + 2) (y + 6) 20
    in
    draw 200 4 tree

let main () =
    let t = Node(1,Nil,Node(2,Node(3,Nil,Nil),(Nil))) in
    Graphics.open_graph " 400x300";
    Graphics.moveto 10 10;
    draw_tree_node t;
    Graphics.read_key ()

let () =
    ignore(main ());
    print_endline ""
