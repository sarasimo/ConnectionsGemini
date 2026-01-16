///@description
//format text
draw_set_color(c_black);
draw_set_font(ft_UI);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if isActive draw_set_alpha(1)
else draw_set_alpha(0.5)

//draw_self();
draw_sprite_stretched_ext(spr_card, 5, x,y, btn_w, sprite_height, image_blend, image_alpha);
draw_sprite_stretched(spr_card, 0, x,y, btn_w, sprite_height);
draw_text(x+sprite_width/2, y+sprite_height/2,txt);

draw_set_alpha(1);