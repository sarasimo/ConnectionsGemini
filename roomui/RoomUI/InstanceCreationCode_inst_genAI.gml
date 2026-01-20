click = function ()
{
    game_mode = gm.ai_game;
    layer_set_visible("UI_GameMode", false);
    layer_set_visible("UI_Help", true);
    instance_create_depth(0,0,0, obj_setup);
}