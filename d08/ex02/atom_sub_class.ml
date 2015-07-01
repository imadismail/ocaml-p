(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   atom_sub_class.ml                                  :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: lguarda <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/25 13:01:29 by lguarda           #+#    #+#             *)
(*   Updated: 2015/06/25 18:33:19 by lguarda          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class hydrogen =
    object
        inherit Atom.atom "hydrogen" "H" 1
    end

class carbon =
    object
        inherit Atom.atom "carbon" "C" 6
    end

class oxygen =
    object
        inherit Atom.atom "oxygen" "O" 8
    end

class argon =
    object
        inherit Atom.atom "argon" "Ar" 18
    end

class aluminium =
    object
        inherit Atom.atom "aluminium" "Al" 13
    end

class mercure =
    object
        inherit Atom.atom "mercure" "Hg" 80
    end

class iode =
    object
        inherit Atom.atom "iode" "I" 53
    end

class cobalt =
    object
        inherit Atom.atom "cobalt" "Co" 27
    end

class helium =
    object
        inherit Atom.atom "helium" "He" 2
    end

class azote =
    object
         inherit Atom.atom "azote" "N" 7
    end

class fluor =
    object
        inherit Atom.atom "fluor" "F" 9
    end

class sodium =
    object
        inherit Atom.atom "sodium" "Na" 11
    end

class soufre =
    object
        inherit Atom.atom "soufre" "S" 16
    end
