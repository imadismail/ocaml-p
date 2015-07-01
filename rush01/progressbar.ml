type point = (int * int)

class virtual progressbar (name:string) (start:point) (size:point) (value:int) =
	object (self)
	  val _name = name
	  val mutable _start = start
	  val mutable _size = size
	  val mutable _value = value
	  method get_x = function |((x, _):point) -> x
	  method get_y = function |((_, y):point) -> y
	  method getValue = _value
	  method setValue v = _value <- v
	  method resize (start:point) (size:point) = _start <- start; _size <- size
	  method draw =
	    let draw_rec x y sx sy =
	      Graphics.moveto x y;
	      Graphics.lineto (x + sx) y;
	      Graphics.lineto (x + sx) (y + sy);
	      Graphics.lineto x (y + sy);
	      Graphics.lineto x y
	    in let draw_text size x y sx sy =
		 Graphics.moveto (((x * 2 + sx) / 2) - (self#get_x size) / 2) (y + sy / 2 + (self#get_y size));
		 Graphics.draw_string _name
	       in let draw_bar x y sx sy v =
		    Graphics.set_color (Graphics.rgb (255 - v * 255 / 100) (v * 255 / 100) 0);
		    Graphics.fill_rect (x + 1) (y + 1) (v * sx / 100 - 2) (sy - 2)
		  in let wrap x y sx sy =
		       draw_rec x y sx (sy / 2);
		       draw_text (Graphics.text_size _name) x y sx sy;
		       draw_bar x y sx (sy / 2) _value
		     in Graphics.set_color Graphics.black;
			wrap (self#get_x _start) (self#get_y _start) (self#get_x _size) (self#get_y _size)
	end

class health value (start:point) (size:point) =
object
  inherit progressbar "Health" start size value
end

class energy value (start:point) (size:point) =
object
  inherit progressbar "Energy" start size value
end

class hygiene value (start:point) (size:point) =
object
  inherit progressbar "Hygiene" start size value
end

class happy value (start:point) (size:point) =
object
  inherit progressbar "Happy" start size value
end

class manager (sx:int) (sy:int) =
object (self)
  val mutable health_progress = new health 100 (0,0) (0,0) 
  val mutable energy_progress = new energy 100 (0,0) (0,0)
  val mutable hygiene_progress = new hygiene 100 (0,0) (0,0)
  val mutable happy_progress = new happy 100 (0,0) (0,0)
  method draw = self#resize (Graphics.size_x ()) (Graphics.size_y ());
		health_progress#draw;
		energy_progress#draw;
		hygiene_progress#draw;
		happy_progress#draw
  method resize sx sy =
    health_progress#resize ((sx/25), 6*sy/7) (sx / 5, sy / 7);
    energy_progress#resize ((7*sx/25), 6*sy/7) (sx / 5, sy / 7);
    hygiene_progress#resize ((13*sx/25), 6*sy/7) (sx / 5, sy / 7);
    happy_progress#resize ((19*sx/25), 6*sy/7) (sx / 5, sy / 7)
  method update a b c d =
    health_progress#setValue a;
    energy_progress#setValue b;
    hygiene_progress#setValue c;
    happy_progress#setValue d
end
