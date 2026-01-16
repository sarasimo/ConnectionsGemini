
click = function ()
{
    if !instance_exists(obj_GM) exit;
    with (obj_GM) event_perform(ev_keypress, 8);
}