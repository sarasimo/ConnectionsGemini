///@description draw text
var _sw, _sh;
_sw = obj_GM.grid_w;
_sh = obj_GM.grid_h;

//stretch collision box
image_xscale = _sw/sprite_get_width(spr_card);
image_yscale = _sh/sprite_get_height(spr_card);

//show_debug_message(image_xscale);

//draw card back
if (selected) draw_sprite_stretched(spr_card, card_img.gray ,x,y,_sw,_sh);
else draw_sprite_stretched_ext(spr_card,card_img.white,x,y,_sw,_sh, image_blend, image_alpha);
//show_debug_message()


//draws frame
draw_self();

//format text
draw_set_color(c_black);
if (selected) draw_set_color(c_white);
draw_set_font(ft_UI);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//draw text box
draw_text_ext(x+_sw/2,y+_sh/2, txt, 8, _sw-_sw/6)
