///@description Submit selection

if game_mode = gm.manual_entry exit;
if !errors_remaining 
{
    n = 0;
    alarm[1] = GAME_SPEED*reveal_time;
    exit;
}

show_debug_message($"ev {event_type} num {event_number}");

#region Check guess submission

if (array_contains(guess_words, noone))
{
    var _str = "Select 4 words before submitting";
    show_debug_message(_str);
    exit;
}



show_debug_message($"current {guess_words} prev {prev_guesses}");
//Cycle through  previous guesses
for(var pg = 0; pg < array_length(prev_guesses); pg++ )
{
    show_debug_message("Checking Guess {0}", pg);
    var matches = 0;
    
    //Cycle through user's guesses
    for(var guess = 0; guess <array_length(guess_words); guess++ )
    {        
		
		//compare each guess word against past guess
        if array_contains(prev_guesses[pg], guess_words[guess])
        {
            matches += 1;
            show_debug_message("Guess num {0} match {1}", prev_guesses[pg], guess_words[guess]);
            if (matches == 4)
            {
                var _str = "Already Guessed!";
                show_debug_message(_str);
                layer_set_visible("UI_AlreadyGuessed", true);
                alarm[0] = msg_time_sec * GAME_SPEED;
                exit;
            }
        }
        else 
        {
            show_debug_message("Category {0} no match {1}", pg, guess_words[guess]);
            guess = 3;
        }
        
    }
    
}

//save guess 
var temp_array = [];
array_copy(temp_array,0, guess_words,0, array_length(guess_words));
array_push(prev_guesses, temp_array);

#endregion


#region Check user submission against categories
//show_debug_message("guesses {0}", guess_words);  

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
    
    //show_debug_message( $"ele {_element} rep {_replace}");
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
    category_hintShown[category_color] = true; 
    category_isSolved[category_color] = true;
    
	with (_banner) col_index = category_color;

}

//Cycle through each category
var catFound = false;

for(var category = 0; category < array_length(active_puzzle); category++ )
{
    show_debug_message("Checking category {0}", category);
    var matches = 0;
    
    //Cycle through words in user's guess
    for(var guess = 0; guess <array_length(guess_words); guess++ )
    {        
		
		//compare each guessed word against the solution of each category
        if array_contains(active_puzzle[category].words, guess_words[guess])
        {
            matches += 1;
            //show_debug_message("Category {0} match {1}", category, guess_words[guess]);
            if (matches == 4)
            {
                show_debug_message("Group found!!!")
				category_color = category;
                array_foreach(guess_cards, reposition_matched_card);
                categories_found += 1;
                guess_words = array_create(4, noone);
                catFound = true;
                break;

            }
        }
        
    }
    
	
    if (matches == 3) 
    {
        layer_set_visible("UI_oneOff", true);
        show_debug_message("One Away!!!")
        alarm[0] = msg_time_sec * GAME_SPEED;
    }
	
	if (category == array_length(active_puzzle)-1 && !catFound)
	{
	    show_debug_message($"matches {matches}")
        errors_remaining --;
        array_foreach(guess_cards, function(_card, _index) 
        {
            with (_card)
            {
                image_blend = c_red;
                direction = choose(0,90,180,270);
                speed = 4;
                alarm[1] = 5;
                alarm[0] = other.error_time * GAME_SPEED;
            }
        })
        
		show_debug_message("Mistakes left {0}", errors_remaining);
		break;
	}
    
        
}



if (errors_remaining && categories_found < 4) exit;


with (par_button)
{
    switch (txt) 
    {
    	default: instance_deactivate_object(self); break;
        case  "Submit": 
            if (categories_found < 4) txt = "Reveal"; 
            else 
            {
                txt = "Next";
                click = function ()
                {
                    room_goto(rm_result);
                }
            }
        break;
        case "Back": //no action
        break;
    }

}
show_debug_message("GAME_OVER!!")

/* //Reveal unguessed 
for (var i = 0; i < array_length(category_isSolved); i++) 
{
    var answer_cards = array_create(0);
    
    if !category_isSolved[i]
    {
        with (obj_card)
        {
            if (array_contains(active_puzzle[i].words, txt)) 
                array_push(answer_cards, id);
        }
        show_debug_message(answer_cards);
        category_color = i;
        array_foreach(answer_cards, reposition_matched_card);
        categories_found += 1;
    }
}


 
#endregion    
