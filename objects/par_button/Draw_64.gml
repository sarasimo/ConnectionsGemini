///@description
//format text
draw_set_color(c_black);
draw_set_font(ft_UI);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if isActive draw_set_alpha(1)
else draw_set_alpha(0.5)

draw_self();
draw_text(x,y,txt);

draw_set_alpha(1);