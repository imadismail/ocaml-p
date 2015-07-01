(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/26 15:39:56 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/26 16:08:20 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


let print_proj = function
    |((t,m,g):App.App.project) -> print_endline
    (t^" grade "^(string_of_int g)^" "^m)

let main () =
    let (monoid:App.App.project) = ("Monoid","succeed",80) in
    let (libft:App.App.project) = ("libft","failed",40) in
    let (sh:App.App.project) = ("sh","failed",40) in
    print_proj App.App.zero;
    print_proj monoid;
    print_proj libft;
    print_proj sh;
    print_proj (App.App.combine libft sh);
    print_proj (App.App.fail monoid);
    print_proj (App.App.success(App.App.fail monoid))

let () = main ()
