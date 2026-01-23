///@description
if (array_length(word_array) <16) 
{
	//test array
    word_array = [
		"cereal", "static", "melted", "snow", 
		"levitate", "salt", "patron", "shovel", 
		"hose", "stationary", "spade"," jackal", 
		"frozen"," rake", "dandruff", "still"]
}

//stores card instances to swap
dragged = noone; 
target = noone;

///Set grid size
//flexpan
grid_w = obj_board.sprite_width/columns;
grid_h = obj_board.sprite_height/rows;
offset = obj_board.x;

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

globalvar guess_words, guess_cards, categories_found, category_color, hints_used,prev_guesses;
guess_words = array_create(4, noone);
guess_cards = array_create(4, noone);

category_color = noone;
categories_found = 0;
errors_remaining = errors_permited;
prev_guesses = [];
category_hintShown = array_create(4,false);
category_isSolved = array_create(4,false);

hints_used = 0;

show_debug_message("brdx {0}, brd y {1}", board_x, board_y );

//get main panel (same as layer)
var _UI = layer_get_flexpanel_node("UI_MainGameRoom");

/*
//get child panels
var _fp = flexpanel_node_get_child(flexpanel_node_get_child(_UI, "MistakePanel"), "Label");
flex_pos = flexpanel_node_layout_get_position(_fp);