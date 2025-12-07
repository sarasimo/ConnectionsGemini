///@description
if (array_get_index(guess_array, noone))
{
    var _str = "Select 4 words before submitting";
    show_debug_message(_str);
    exit;
}

if game_mode = gm.nyt_companion  exit;
#region Check user submission against categories
show_debug_message("guesses {0}", guess_array);  

//Cycle through each category
for(var category =0; category <array_length(active_puzzle); category++ )
{
    show_debug_message("Checking category {0}", category);
    //Cycle through user's guesses
    for(var guess =0; guess<array_length(guess_array); guess++ )
    {
        
        show_debug_message("Checking guess word {0}", guess_array[guess]);
        if array_contains(active_puzzle[category].words, guess_array[guess])
        {
            if (guess == 4)
            {
                show_debug_message("Group found!!!")
                with (obj_card) if (selected) 
                {
                    image_index = category + 1;
                    image_blend = category + 1;
                    selected = false;
                }
                exit;
            }
        }
        else 
        {
            if (guess == 3) 
            {
                layer_set_visible("UI_oneOff", true);
                alarm[0] = 2.5 * GAME_SPEED;
                exit;
            }
            break;
        }
    }
}
   
    
 
#endregion    
