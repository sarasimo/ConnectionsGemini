///@description
if (array_get_index(guess_words, noone))
{
    var _str = "Select 4 words before submitting";
    show_debug_message(_str);
    exit;
}

if game_mode = gm.nyt_companion  exit;
#region Check user submission against categories
show_debug_message("guesses {0}", guess_words);  


function reposition_matched_card(_element, _index)
{
    
    
    var _t = collision_point( board_x[_index], board_y[categories_found], obj_card, false, true);
    if _t 
    {
        _t.last_x = _t.x;
        _t.last_y = _t.y;
        _t.x = _element.x
        _t.y = _element.y;

    }
    
    _element.y = _t.last_y//board_y[categories_remaining];
    _element.x = _t.last_x//board_x[_index];
}

//Cycle through each category
for(var category = 0; category < array_length(active_puzzle); category++ )
{
    show_debug_message("Checking category {0}", category);
    var matches = 0;
    
    //Cycle through user's guesses
    for(var guess =0; guess<array_length(guess_words); guess++ )
    {
        
        //show_debug_message("Checking guess word {0}", guess_words[guess]);
        if array_contains(active_puzzle[category].words, guess_words[guess])
        {
            matches += 1;
            show_debug_message("Category {0} match {1}", category, guess_words[guess]);
            if (matches == 4)
            {
                show_debug_message("Group found!!!")
                with (obj_card) if (selected) 
                {
                    col_index = category + 1;
                    selected = false;
                    alarm[0] = 1;
                    
                }
                
                array_foreach(guess_cards, reposition_matched_card);
                categories_found += 1;
                guess_words = array_create(4, noone);
                exit;
            }
        }
        else 
        {
            show_debug_message("Category {0} no match {1}", category, guess_words[guess]);
            //break;
        }
        
    }
    
    if (matches == 3) 
    {
        layer_set_visible("UI_oneOff", true);
        show_debug_message("One Away!!!")
        alarm[0] = 5 * GAME_SPEED;
        exit;
    }
    
    errors_permited-= 1;
    show_debug_message("Mistakes left {0}", errors_permited);
    
}
   
 
#endregion    
