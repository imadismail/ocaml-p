(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   App.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/26 15:13:30 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/26 16:59:23 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module App =
struct
    type project = string * string * int

    let zero = (("","",0):project)

    let combine (p1:project) (p2:project) =
        let get_grade (pr:project) = match pr with
        | (_,_,grade) -> grade in

        let get_type (pr:project) = match pr with
        | (typ,_,_) -> typ in
        let final_grad = (get_grade p1) + (get_grade p2) in
        if final_grad >= 80
        then ((((get_type p1) ^ (get_type p2)),"succeed",final_grad):project)
        else ((((get_type p1) ^ (get_type p2)),"failed",final_grad):project)

    let fail = function | ((s,_,_):project) -> ((s,"failed",0):project)

    let success = function | ((s,_,_):project) -> ((s,"success",80):project)
end
