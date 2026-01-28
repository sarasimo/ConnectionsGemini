///@description 
/*
var bk_id = layer_get_id("Background");
layer_background_sprite(bk_id, spr_bkTile);
layer_background_stretch(bk_id, true);
layer_background_blend(layer_get_element_type(layerelementtype_background), bk_col);
show_debug_message($"Background code! {bk_id}")
*/

switch (room) 
{
	case rm_genrated:
        display_set_gui_size(room_width, room_height);
        layer_set_visible("UI_MainGameRoom", false);
        layer_set_visible("UI_GameMode", true);
        //layer_set_visible("UI_Results", false);
    break;
    
    case rm_result:
        layer_set_visible("UI_MainGameRoom", false);
        layer_set_visible("UI_GameMode", false);
        layer_set_visible("UI_Results", true);
    break;
}
