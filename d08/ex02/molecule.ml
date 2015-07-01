(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   molecule.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/25 13:42:16 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/25 18:44:51 by lguarda          ###   ########.fr       *)
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

(*Now that you have your atoms, you can make some molecules! If you don’t know
what a molecule is, please look it up before beginning this exercise.
Your molecule class is virtual, and it needs at least the following things:
• A name, of type string.
• A formula, of type string.
All these things have to be methods. Of course, feel free to look up what a molecule
is if you don’t understand what these are.
One very important constraint: you have to store the molecule’s atoms internally and
this atom storage must be used to compute the molecule’s chemical formula. Also, the
chemical formula must be formatted using the Hill notation. As such, your constructor
will only accept a name and a list of atoms.
The chemical formula is simple: it’s a small string which describes what atoms
and how many of them are contained in the molecule. Let’s build an example with
Trinitrotoluene (or TNT for short). We get the list of atoms, and we end up with:
• 3 atoms of Nitrogen
• 5 atoms of Hydrogen
• 6 atoms of Oxygen
• 7 atoms of Carbon

We know the symbols of these atoms are N, H, O and C. All we have to do is enumerate
their symbols and their quantity, right? So you would get something like: N3H5O6C7
.
But NO! WAIT! That’s not how it works. The Hill notation says we get carbon, then
hydrogen, then everything else in alphabetical order. So the result is: C7H5N3O6
. Of
course, you can’t really write subscripts in a terminal, so writing it behind the symbol as
it is is fine, like so: C7H5N3O6.
Your class will contain at least a to_string method to describe shortly what your
molecule is, and an equals method to compare molecules; aside from that, you can
implement anything you think is suitable or you may need in the next exercises.
To go along with your molecule class, you will write some real molecules, which will
of course inherit your molecule class. You have to write at least the following classes:
• Water (H2O))
• Carbon dioxyde (CO2
)
• And three more molecules of your choice, as long as they really exist.*)
