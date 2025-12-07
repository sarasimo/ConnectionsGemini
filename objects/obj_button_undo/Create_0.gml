///@description goto function
click = function()
{
    array_pop(word_array); //remove last entry
	
	//rewrite display string;
	if (!instance_exists(obj_input)) exit; //if obj input isnt found
	obj_input.str = "";
	var _r = 4;
	for (var i=0; i<array_length(word_array); i++)
	{
	    obj_input.str += word_array[i] + ". "
		
		_r--;
		if (_r == 0)
		{
		    obj_input.str += "\n "
			_r = 4;
		}
		
	}
	obj_input.row = _r;
}

