///@description Draw mistake pips

if game_mode = gm.nyt_companion exit;

var _x, _spr;

_x = x;
_spr = spr_card;

//draw fill
for (var i = 0; i < errors_remaining; i++) 
{
	draw_sprite(_spr, card_img.white, _x,y);
    _x += sprite_get_width(_spr)*1.5;
}

//Draw Containers
_x = x;
for (var i = 0; i < errors_permited; i++) 
{
	if (i >= errors_remaining) alpha = 0.8;
    else alpha = 1;
    draw_sprite_ext(_spr, card_img.yellow, _x,y, 1,1, 0, c_ltgray, alpha);
    _x += sprite_get_width(_spr)*1.5;
}
	
/*
//get struct linked to panel
	var textStruct = flexpanel_node_get_struct(textPanel);
	//Reference variable hosting text
	var textId = textStruct.layerElements[0].elementId;
	//edits text
