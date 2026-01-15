///@description Draw mistake pips
var _x, _spr;

_x = x;
_spr = spr_card;

for (var i = 0; i < errors_remaining; i++) 
{
	draw_sprite(_spr, 6, _x,y);
    _x += sprite_get_width(_spr)*1.5;
}

_x = x;
for (var i = 0; i < errors_permited; i++) 
{
	draw_sprite(_spr, 0, _x,y);
    _x += sprite_get_width(_spr)*1.5;
}
	
/*
//get struct linked to panel
	var textStruct = flexpanel_node_get_struct(textPanel);
	//Reference variable hosting text
	var textId = textStruct.layerElements[0].elementId;
	//edits text
