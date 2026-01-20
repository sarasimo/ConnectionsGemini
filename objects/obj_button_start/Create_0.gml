///@description goto function
click = function()
{
    //if game_mode = gm.nyt_companion layer_set_visible("UI_CompanionRoom", true);
    //else 
    layer_set_visible("UI_MainGameRoom", true);
    
    layer_set_visible("UI_Help", false)
    
    if (room != rm_gameboard) room_goto(rm_gameboard);
}

