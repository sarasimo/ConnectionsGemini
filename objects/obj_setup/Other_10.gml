///@description generate an array to use in creating a game board

globalvar word_array;
word_array = [];

for (var i = 0; i < array_length(active_puzzle); i++)
{
    var _array = active_puzzle[i].words
    for (var j = 0; j < array_length(_array); j++) 
    {
    	array_push(word_array, active_puzzle[i].words[j]);
    }
    
}

word_array = array_shuffle(word_array);
room_goto(rm_gameboard);