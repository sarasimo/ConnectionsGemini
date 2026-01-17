///@description generate an array to use in creating a game board


for (var i = 0; i < array_length(active_puzzle); i++)
{
    var _array = active_puzzle[i].words
    for (var j = 0; j < array_length(_array); j++) 
    {
    	array_push(word_array, active_puzzle[i].words[j]);
    }
    
}

word_array = array_shuffle(word_array);

show_debug_message("myInstanceBtn");
show_debug_message(instance_find(obj_button_start, 0));
obj_button_start.isActive = true;
/*
layer_set_visible("UI_MainGameRoom", true);
room_goto(rm_gameboard);