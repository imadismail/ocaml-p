type point = (int * int)

class button (name:string) =
    object(self)
        val _name        = name
        val _nsize       = Graphics.text_size name
        val mutable _x = 0
        val mutable _lx = 0
        val mutable _y = 0
        val mutable _ly = 0

        method print_button b =
            if b then self#draw_Fsquare
            else self#draw_Esquare

        method is_click x y =
            if (x>=_x-_lx) && (x<=_x+_lx)&&(y>=_y-_ly) && (y<=_y+_ly)
            then true
            else false

        method get_name = _name
        method get_nsize = _nsize
        method get_nsizex = self#get_x _nsize
        method get_nsizey = self#get_y _nsize
        (*                          private                                           *)

        method private draw_Fsquare =
            Graphics.set_color (Graphics.rgb 125 125 125);
            Graphics.fill_rect (_x-_lx) (_y-_ly) (_lx*2) (_ly*2);
            Graphics.moveto (_x - ((self#get_x _nsize) /2))
            (_y- + (self#get_y _nsize)/2);
            Graphics.set_color Graphics.white;
            Graphics.draw_string _name

        method private draw_Esquare =
            Graphics.set_color (Graphics.rgb 125 125 125);
            Graphics.draw_rect (_x-_lx) (_y-_ly) (_lx*2) (_ly*2);
            Graphics.moveto (_x - ((self#get_x _nsize) /2))
            (_y- + (self#get_y _nsize)/2);
            Graphics.draw_string _name

        method resize width height i=
            _lx <- (width / 16);
            _x <- (width / 5) * (i+1);
            _ly <- (height / 16);
            _y <- (height / 8)

        method get_x = function
            |((x,_):point) -> x

        method get_y = function
            |((_,y):point) -> y

    end

class button_manager =
    object(self)
        val _buttonLst = [new button "Eat";new button "Thunder";new button
        "Bath";new button "Kill"]
        val mutable oldw = 0
        val mutable oldh = 0
        val mutable _time = 0.
        val mutable _isClick = true

        method draw x y=
            let rec for_each lst i = match lst with
            |head::tail when head#is_click x y ->
                    head#print_button false; for_each tail (i+1)
            |head::tail -> head#print_button true; for_each tail (i+1)
            |_ -> () in
            for_each _buttonLst 0

        method click (x:int) (y:int) =
            let rec for_each lst i = match lst with
            |head::tail when head#is_click x y -> i
            |head::tail -> for_each tail (i + 1)
            |_-> (-1) in
            if _isClick = true
            then begin _isClick<-false;for_each _buttonLst 0 end
            else (-1)

        method set_isClick = _isClick <- true

        method update w h =
            let rec for_each lst i = match lst with
            |head::tail -> head#resize w h i; for_each tail (i + 1) |_->() in
            for_each _buttonLst 0
            end
