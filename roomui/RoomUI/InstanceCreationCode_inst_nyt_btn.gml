date_selected = date_current_datetime();

click = function ()
{
    game_mode = gm.nyt_companion;
    layer_set_visible("UI_GameMode", false);
    layer_set_visible("UI_Help", true);
    instance_create_depth(0,0,0, obj_setup);
}