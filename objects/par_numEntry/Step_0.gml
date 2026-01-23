///@description Update field


if isActive
{
	// get numbers only
    var _ks = string_digits(keyboard_string);
    
    if (_ks != "")
    {
        txt = _ks;
        
    }
	
}
else 
{
    adjust_min_max();
    txt = clamp(txt, min_val, max_val);
}

if keyboard_check_pressed(vk_enter) event_user(0);
