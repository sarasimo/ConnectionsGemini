///@description draw solved banner

var _sw, _sh;
_sw = obj_board.sprite_width;
_sh = obj_GM.grid_h;

draw_sprite_stretched_ext(spr_card,card_img.white,x,y,_sw,_sh, image_blend, image_alpha);
draw_sprite_stretched(spr_card, card_img.black ,x,y,_sw,_sh);

//format text
draw_set_color(c_black);
draw_set_font(ft_UI_bold);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//draw text box
draw_text_ext(x+_sw/2,y+_sh/3, category, 8, _sw-_sw/6)

draw_set_font(ft_UI);
draw_text_ext(x+_sw/2,y+_sh*2/3, words_str, 8, _sw-_sw/6)
