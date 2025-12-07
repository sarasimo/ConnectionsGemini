///@description draw text
var _sw, _sh;
_sw = obj_GM.sw;
_sh = obj_GM.sh;

//stretch collision box
image_xscale = _sw/sprite_get_width(spr_stretch);
image_yscale = _sh/sprite_get_height(spr_stretch);

//show_debug_message(image_xscale);
draw_self();
//draw sprite
//draw_sprite_stretched(spr_stretch,0,x,y,_sw,_sh);

//format text
draw_set_color(c_black);
if (selected) draw_set_color(c_white);
draw_set_font(ft_UI);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//draw text box
draw_text_ext(x+_sw/2,y+_sh/2, txt, 8, _sw-_sw/6)
