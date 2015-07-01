type point = (int * int)

class tama =
    object (self)
        val mutable _health = 100
        val mutable _energy = 100
        val mutable _hygiene = 100
        val mutable _happy = 100
        val mutable _size = 100
        val progress = new Progressbar.manager (Graphics.size_x ()) (Graphics.size_y ())
        val buttons = new Button.button_manager

        method get_buttons = buttons

        method update = progress#update _health _energy _hygiene _happy;
        buttons#update (Graphics.size_x ()) (Graphics.size_y ());
        _size <- ((Graphics.size_x ()) + (Graphics.size_y ())) / 15;

        method draw x y = progress#draw;buttons#draw x y;
        let mx = (Graphics.size_x () / 2)
        in let my = (Graphics.size_y () / 2)
	   in let draw_fill_circle x y r =
		let dist xa ya xb yb = sqrt ((xb -. xa) *. (xb -. xa) +. (yb -. ya) *. (yb -. ya))
		in for i = (x - r) to (x + r) do for j = (y - r) to (y + r) do if (dist (float_of_int i) (float_of_int j) (float_of_int x) (float_of_int y) < (float_of_int r)) then Graphics.plot i j done done
              in Graphics.set_color Graphics.yellow;
		 draw_fill_circle mx my _size;
		 Graphics.set_color (Graphics.rgb (255 - _health * 255 / 100) (0) (_health * 255 / 100));
		 draw_fill_circle (mx - _size / 4) (my + _size / 4) (_size / 7);
		 draw_fill_circle (mx + _size / 4) (my + _size / 4) (_size / 7);
		 Graphics.moveto (mx - _size / 2) (my - _size / 4);
		 Graphics.set_color Graphics.black;
		 Graphics.curveto (mx - _size / 3, my - _size / (8 - 7*_happy/100)) (mx + _size / 3, my - _size / (8 - 7*_happy/100)) (mx + _size / 2, my - _size / 4)
	
        method setHappy x = _happy <- (_happy + x); if (_happy <= 0) then failwith "Your yellow ball died in tears";
        if _happy > 100 then _happy <-100 else if _happy < 1 then _happy <- 1

        method setEnergy x = _energy <- (_energy + x); if (_energy <= 0) then failwith "Your yellow ball died while sleeping";
        if _energy > 100 then _energy <-100 else if _energy < 1 then _energy <- 1

        method setHealth x = _health <- (_health + x); if (_health <= 0) then failwith "Your yellow ball died from death";
        if _health > 100 then _health <-100 else if _health < 1 then _health <- 1

        method setHygiene x = _hygiene <- (_hygiene + x); if (_hygiene <= 0) then failwith "Your yellow ball died from AIDS";
        if _hygiene > 100 then _hygiene <-100 else if _hygiene < 1 then _hygiene <- 1

        method setStats he en hy ha =
            self#setHappy ha;
            self#setEnergy en;
            self#setHealth he;
            self#setHygiene hy

        method onClick b x y =
        if b = true then 
        begin match (buttons#click x y) with
            | 0 -> self#setStats 25 (-10) (-20) 5 ; Graphics.sound 174 200
            | 1 -> self#setStats (-20) 25 0 (-20) ; Graphics.sound 185 200
            | 2 -> self#setStats (-20) (-10) 25 5 ; Graphics.sound 196 200
            | 3 -> self#setStats (-20) (-10) 0 20 ; Graphics.sound 207 200
            |_ -> ()
            end
        else ()
    end
