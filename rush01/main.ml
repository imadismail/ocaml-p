let timeManager oldTime ctime tama =
    if (ctime -. oldTime) >= 1.
    then begin tama#setHealth (-1);
    tama#get_buttons#set_isClick ;ctime end
    else oldTime

let initWindow =
    Graphics.open_graph " 1200x800"

 let lockSize ()=
     let y = (Graphics.size_y ()) in
     let x = (Graphics.size_x ()) in
     if y < 350 then Graphics.resize_window x 350;
     if x < 350 then Graphics.resize_window 350 y

let isDrawalbe ()=
    if (Graphics.size_y()) < 350 || (Graphics.size_x ())< 350
    then false
    else true

let rec loop_event tama oldTime =
    let ctime = (Unix.time()) in
    let (e:Graphics.status) = Graphics.wait_next_event [Key_pressed;Button_down;Poll] in
     Graphics.clear_graph ();
     lockSize ();
     tama#update;
     if (isDrawalbe()) then tama#draw e.mouse_x e.mouse_y;
     tama#onClick e.button e.mouse_x e.mouse_y;
     Graphics.synchronize ();
     oldTime := timeManager !oldTime ctime tama;
     if e.keypressed = true && int_of_char (Graphics.read_key ()) = 27
     then failwith "You stopped the game"
     else loop_event tama oldTime

let rekt () =
    initWindow;
    Graphics.set_window_title "Let Rekt";
    let tama = new Tama.tama in
    let oldTime  = ref (Unix.time ()) in
    Graphics.display_mode false;
    tama#update;
    loop_event tama oldTime;
    ""

let main () =
  let e =
    try rekt () with
    | Graphics.Graphic_failure err -> "Stopped game"
    | Failure err -> err
    | _ -> ""
  in print_endline (e)

let () =
  ignore (main ());
  print_endline "Game over"
