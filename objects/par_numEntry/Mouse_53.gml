///@description
var _inst = collision_point(mouse_x,mouse_y, par_numEntry, false, false) 
show_debug_message(_inst);

if _inst == noone 
{
    event_user(0);
}
