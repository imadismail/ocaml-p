(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   molecule.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/25 13:42:16 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/26 21:18:44 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual molecule name atoms =
    object(self)
        val _name:string        = name
        val _atoms:Atom.atom list    = atoms

        method name = _name
        method formula = self#hill_sort _atoms
        method to_string = _name ^ ": " ^ self#formula
        method equals (m2:molecule) = (m2#formula = self#formula)
(*                            private                                         *)
        method private encode alist =
          let rec hash list n out = match list with
            | e1::e2::l when e1 = e2 -> hash (e2::l) (n + 1) out
            | e1::e2::l when n > 1 -> hash (e2::l) 1 (out ^ e1 ^ (string_of_int n))
            | e1::e2::l -> hash (e2::l) 1 (out ^ e1)
            | e1::l when n > 1-> hash l 1 (out ^ e1 ^ (string_of_int n))
            | e1::l -> hash l 1 (out ^ e1)
            | _ -> out
          in
            hash alist 1 ""

        method private get_sym lst =
            let rec get_symbol (alst:Atom.atom list) = match alst with
            |head::tail -> head#symbol :: (get_symbol tail)
            |_ -> [] in
            get_symbol lst

        method private insert_alpha (elem:Atom.atom) (alist:Atom.atom list) =
            let rec loop (lst:Atom.atom list) (newlst:Atom.atom list) = match lst with
            |head::tail when head#symbol < elem#symbol -> loop tail (( @ )newlst [head])
            |head::tail -> (( @ )(( @ )(( @ ) newlst [elem]) [head]) tail)
            |_ -> (( @ ) newlst [elem])
            in
            loop alist []

        method private sort_alpha (alist:Atom.atom list) = 
            let rec loop lst newlst = match lst with
            |head::tail -> loop tail (self#insert_alpha head newlst)
            |_-> newlst
            in
            loop alist []

        method private hill_sort lst =
            let nc = self#if_elem lst 6 in
            let nh = self#if_elem lst 1 in
            let nlst = self#extract (self#extract lst 6) 1 in
            if (nc > 0 && nh > 0)
            then self#encode ((@)((@)(self#repeat_lst_char "C" nc)
            (self#repeat_lst_char "H" nh)) (self#get_sym(self#sort_alpha nlst)))
            else self#encode (self#get_sym (self#sort_alpha _atoms))


        method private if_elem lst nu =
                let rec if_elem2 alst = match alst with
                    |head::tail when head#atomic_number = nu -> 1 + if_elem2 tail
                    |head::tail -> if_elem2 tail
                    | _ -> 0
                in if_elem2 lst

        method private extract (alst:Atom.atom list) (at:int) =
                let rec loop lst newlst = match lst with
                |head::tail when head#atomic_number = at -> loop tail newlst
                |head::tail -> loop tail (( @ )newlst [head])
                |_ -> newlst
                in
                loop alst ([]:Atom.atom list)

        method private repeat_lst_char c num =
                let rec repeat_char n =
                    if n > 0 then c :: repeat_char (n - 1)
                    else []
                in repeat_char num
 end
