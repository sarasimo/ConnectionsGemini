///@description populate array
if (array_length(word_array) == 16) 
{
    obj_button_start.isActive = true; 
	exit;
}

if (!testMode ) obj_button_start.isActive = false; 


if keyboard_check_pressed(vk_enter)
{
	// get letters only
	var _ks = string_letters(keyboard_string) 
	show_debug_message(array_length(word_array))
	//
	if (array_contains(word_array, keyboard_string)|| string_length(_ks) <= 2)
	{
	    keyboard_string = "";
		exit;
	}
	
	array_push(word_array, keyboard_string);
	row --;
	str += keyboard_string +". "
	if row == 0
	{
	    str += "\n "
		row = 4;
	}
	keyboard_string = ""; //empty keyboard string
	
}


