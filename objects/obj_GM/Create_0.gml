///@description
if (array_length(word_array) <16) 
{
	word_array = [
		"potato", "brain", "litter", "feature", 
		"sixteen", "crepe paper", "prune", "talk", 
		"tooth", "shar pei", "pepper"," film", 
		"scatter"," sprinkle", "flick", "picture"]
}

//stores card instances to swap
dragged = noone; 
target = noone;

///Draw cards
//var  _sw, _n;
//var _sw = sprite_get_width(spr_card);
//var _sh = sprite_get_height(spr_card); 
sw = room_width/columns;
sh = room_height/rows;

var _n = 0; //keeps track of words read from the array

//Generate grid or words
for (var c=0; c<columns; c++) 
{
    for (var r=0; r<rows; r++) 
	{
	    var _inst = instance_create_depth(offset+c*sw, offset+r*sh,0,cards)				
		_inst.txt = word_array[_n]
		//show_debug_message(_n)
		_n++;
	}
}

globalvar guess_array;
guess_array = array_create(4, noone);
seletion_array = array_create(4, noone);