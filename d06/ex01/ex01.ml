(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ex01.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 13:51:17 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/23 16:59:55 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module StringHash =
        struct
          type t = string
          let equal i j = Hashtbl.HashedType.equal i j
          let hash i = Hashtbl.HashedType.hash i
        end
module StringHashtbl = Hashtbl.Make(StringHash)


let () =
let ht = StringHashtbl.create 5 in
let values = [ "Hello"; "world"; "42"; "Ocaml"; "H" ] in
let pairs = List.map (fun s -> (s, String.length s)) values in
List.iter (fun (k,v) -> StringHashtbl.add ht k v) pairs;
StringHashtbl.iter (fun k v -> Printf.printf "k = \"%s\", v = %d\n" k v) ht
