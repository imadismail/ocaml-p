(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   gray.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <lguarda@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/17 16:36:39 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/18 13:25:42 by lguarda          ###   ########.fr       *)
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
  | h::t -> print_int h ; printRow t
  | _ -> ()

let rec printColumn tab isn = match tab with
  | h::t when isn = true -> printRow h ; print_char '\n' ;printColumn t isn
  | h::t -> printRow h ; print_char ' ' ;printColumn t isn
  | _ -> ()

let addBit list  =
  cat list (revTab list)

let rec final lst len newlst i = match lst with
  | head::tail when i < len -> (final tail len ((1 :: head) :: newlst) (i + 1))
  | head::tail -> (final tail len ((0 :: head) :: newlst) (i + 1))
  | _ -> newlst

let pow i j =
  let rec pow_rec x y acc =
    if y = 0 then acc
    else pow_rec x (y - 1) (x * acc)
  in
    pow_rec i j i


let gray x =
  let main_list = [[0];[1]] in
  let rec recc main_lst i len =
        if i = len then main_lst
        else recc (final(addBit main_lst) (pow 2 i) [] 0) (i + 1) len
  in
    recc main_list 0 (x -1)

let main () =
    printColumn (gray 1) false;
    print_char '\n';
    printColumn (gray 2) false;
    print_char '\n';
    printColumn (gray 3) false;
    print_char '\n';
    printColumn (gray 4) true;
    print_char '\n';
    printColumn (gray 5) true;
    print_char '\n'


let () = main ()
