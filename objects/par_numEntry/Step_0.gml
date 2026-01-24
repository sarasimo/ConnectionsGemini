///@description Update field



if isActive
{
	// get numbers only
    var _ks = string_digits(keyboard_string);
    _ks = string_copy(_ks, 1, max_digits);
    
    if (_ks != "")
    {
        txt = _ks;
        
    }
    
	
}
else 
{
    if (isHovering)
    //(mouse_wheel_up() || mouse_wheel_down())
    {
        if (mouse_wheel_down()) txt --;
        if (mouse_wheel_up()) txt ++;

    }
    
    adjust_min_max();
    txt = clamp(txt, min_val, max_val);
}



if keyboard_check_pressed(vk_enter) event_user(0);
