///@description Draw Error Text;
if !showError exit;

//format text
draw_set_color(c_black);
draw_set_font(ft_error);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _offset = 16;
var _ln_spc = 20;
draw_text_ext(inst_errorContainer.x + _offset, inst_errorContainer.y + _offset, status, _ln_spc, inst_errorContainer.sprite_width-(_offset*2));
