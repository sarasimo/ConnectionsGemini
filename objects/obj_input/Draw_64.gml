///@description display text
var _ww = window_get_width();
var _wh = window_get_height()
//draw_rectangle_color(-100,-100, _ww, _wh,col2,col2,col,col,false)

//format text
draw_set_color(c_black);
draw_set_font(ft_UI);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Draw input box
var _w = window_get_width()/3; //set text box width
draw_sprite_stretched(spr_stretch,0,x-_w/2,y-32,_w, 64);
if (array_length(word_array) < 16) draw_text(x, y, keyboard_string);

//Draw submitted words
draw_set_valign(fa_top);
draw_text_ext(x, y+64,str ,32, room_width-_w);
