///@description Submit selection

if game_mode = gm.nyt_companion || !errors_remaining exit;

show_debug_message($"ev {event_type} num {event_number}");

#region Check guess submission

if (array_get_index(guess_words, noone) != -1)
{
    var _str = "Select 4 words before submitting";
    show_debug_message(_str);
    exit;
}

if (array_get_index(prev_guesses, guess_words) != -1)
{
    var _str = "ALREADY GUESSED!!";
    show_debug_message(_str);
    exit;
}


#endregion


#region Check user submission against categories
show_debug_message("guesses {0}", guess_words);  

//this function moves the cards from a correct guess to the top 
function reposition_matched_card(_element, _index)
{
    //find card in target position and move them to solved cards location   
    var _replace = collision_point( board_x[_index]+offset, board_y[categories_found]+offset, obj_card, false, true);
	var target_x, target_y;
    
    if _replace != noone
    {
        target_x = _replace.x;
        target_y = _replace.y;
        _replace.x = _element.x
        _replace.y = _element.y;
		_replace.last_x = _replace.x;
        _replace.last_y = _replace.y;

    }
    
    show_debug_message( $"ele {_element} rep {_replace}");
	with (_element)
	{
		
        selected = false;
		
		x = target_x;
		y = target_y;
		
		col_index = category_color;
        alarm[0] = 1;
	}
    	
	instance_destroy(_element);
	var _banner = instance_create_depth(board_x[0],board_y[categories_found],depth, obj_banner, active_puzzle[category_color])
	with (_banner) col_index = category_color;

}

//Cycle through each category
for(var category = 0; category < array_length(active_puzzle); category++ )
{
    show_debug_message("Checking category {0}", category);
    var matches = 0;
    
    //Cycle through user's guesses
    for(var guess = 0; guess <array_length(guess_words); guess++ )
    {        
		
		//compare each guess word against solution
        if array_contains(active_puzzle[category].words, guess_words[guess])
        {
            matches += 1;
            show_debug_message("Category {0} match {1}", category, guess_words[guess]);
            if (matches == 4)
            {
                show_debug_message("Group found!!!")
				category_color = category;
                array_foreach(guess_cards, reposition_matched_card);
                categories_found += 1;
                guess_words = array_create(4, noone);
                exit;
            }
        }
        else 
        {
            show_debug_message("Category {0} no match {1}", category, guess_words[guess]);
        }
        
    }
    
	
    if (matches == 3) 
    {
        layer_set_visible("UI_oneOff", true);
        show_debug_message("One Away!!!")
        alarm[0] = msg_time_sec * GAME_SPEED;
    }
	
	if (matches > 0)
	{
	    errors_remaining --;
		show_debug_message("Mistakes left {0}", errors_remaining);
		break;
	}
    
        
}

//save guess 
array_push(prev_guesses, guess_words);

if (!errors_remaining)
{
    show_debug_message("GAME_OVER!!")
    //GAMEOVER
}

 
#endregion    
