///@description Move and swap cards

if (mouse_check_button_pressed(mb_left))
{
    dragged = collision_point(mouse_x,mouse_y, obj_card,0,0);
    show_debug_message("dragged {0}", dragged);
    if (dragged != noone) with (dragged)
	{
	    dx = x - mouse_x;
		dy = y - mouse_y;
	}
}

if (mouse_check_button_released(mb_left)) 
{
	with (dragged)
	{
		#region click a card - no drag
        
	    if (x == last_x && y == last_y)
		{

            for (var i = 0; i< array_length(guess_words); i++) 
            {
                if (guess_words[i] == noone)
                {
                    guess_words[i] = txt;
                    guess_cards[i] = id;
                    show_debug_message("selected {0}", guess_words[i]);
                    selected = true;
                    break;
                }
            }
			exit;
		}
        
        #endregion
        
		#region drag card to new position
        
        var _t = collision_point(mouse_x,mouse_y, obj_card,0,true);
		if (_t != noone) //if on top of other card
		{
		    other.target = _t;
            
			//place in target's position
			x = _t.x;
			y = _t.y;			
			
			//send target to dragged card's prior position
			_t.x = last_x;
			_t.y = last_y;
			
			//store new positions
			_t.last_x = _t.x;
			_t.last_y = _t.y;
			last_x = x;
			last_y = y;
			
		}
		else //if no target is found
		{
			//send to previous position
		    x = last_x;
			y = last_y;
		}
        #endregion
        
		
	}
	dragged = noone;
}

//move with mouse
if (mouse_check_button(mb_left) && dragged != noone) with (dragged)
{	
	x = mouse_x + dx;
	y = mouse_y + dy;
}



//deselect cards
if (mouse_check_button_pressed(mb_right) && !mouse_check_button(mb_left)) 
{
    var _inst = collision_point(mouse_x,mouse_y, obj_card,0,0); 
    
	if (!_inst) exit;
    if (_inst.selected)
    {
		var _idx = array_get_index(guess_words, _inst.txt);
		guess_words[_idx] = noone;
	    guess_cards[_idx] = noone;
	    _inst.selected = false;
		
		show_debug_message("deselected {0}", guess_words[_idx]);      
    }
	else _inst.image_index = card_img.black;
    
}

#region Change colour borders
if device_mouse_check_button_pressed(0, mb_middle) 
{
    var _inst = collision_point(mouse_x,mouse_y, obj_card,0,0);
	_inst.image_index = card_img.black;
}

if !(mouse_wheel_up() || mouse_wheel_down()) exit;
 
var _inst = collision_point(mouse_x,mouse_y, obj_card,0,0);   
if (mouse_wheel_up())
{
    _inst.image_index -= 1; //go to next colour
}

if (mouse_wheel_down())
{
    _inst.image_index += 1; //go to previous color
}

_inst.image_index = clamp_cycle(_inst.image_index, 1, 4)
//_inst.alarm[0] = 1; //runs colour change code

#endregion
