(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   gray.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/17 16:36:39 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/17 20:17:14 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


let revTab list =
    let rec loop tab newtab = match  tab with
      | head::tail -> (loop tail (head :: newtab))
      | _ -> newtab
    in
    loop list []

let rec cat l1 l2 = match l1 with
  | h::t -> h :: (cat t l2)
  | [] -> l2


let rec printRow tab  = match tab with
  | h::t -> print_int h ;print_char ' '; printRow t
  | _ -> ()

let rec printColumn tab i len = match tab with
  | h::t when i < len -> print_string "0 " ;printRow h ; print_char '\n' ;printColumn t (i + 1) len
  | h::t -> print_string "1 ";printRow h ; print_char '\n' ;printColumn t (i + 1) len
  | _ -> ()

let addBit list  =
  cat list (revTab list)

let rec final lst len newlst i = match lst with
  | head::tail when i <= (len / 2) -> (final tail len ((1 :: head) :: newlst) (i + 1))
  | head::tail -> (final tail len ((0 :: head) :: newlst) (i + 1))
  | _ -> newlst

let main () =
  let main_list = [[0];[1]] in
  let rec recc main_lst bit i =
        if i = bit then main_lst
        else recc (final(addBit  main_lst) i [] 0) bit (i + 1)
  in
    printColumn (addBit (recc main_list 3 2)) 0 3


let () = main ()
