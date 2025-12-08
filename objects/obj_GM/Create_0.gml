///@description
if (array_length(word_array) <16) 
{
	//test array
    word_array = [
		"potato", "brain", "litter", "feature", 
		"sixteen", "crepe paper", "prune", "talk", 
		"tooth", "shar pei", "pepper"," film", 
		"scatter"," sprinkle", "flick", "picture"]
}

//stores card instances to swap
dragged = noone; 
target = noone;

///Set grid size
grid_w = room_width/columns;
grid_h = room_height/rows;

var _n = 0; //keeps track of words read from the array

globalvar board_x; //array that stores the x corrdinates of columns
globalvar board_y; //array that stores the y corrdinates of rows

//Generate grid or words
for (var c = 0; c <columns; c++) 
{
    var _inst = noone;
    for (var r=0; r<rows; r++) 
	{
	    _inst = instance_create_depth(offset+ c*grid_w, offset+ r*grid_h,0,cards)				
		_inst.txt = word_array[_n]
        board_y[r] = _inst.y;
		//show_debug_message(_n)
		_n++;
	}
    board_x[c] = _inst.x;
}

globalvar guess_words, guess_cards, categories_found, category_color;
guess_words = array_create(4, noone);
guess_cards = array_create(4, noone);

category_color = noone;
categories_found = 0;
errors_permited = 4;


show_debug_message("brdx {0}, brd y {1}", board_x, board_y );