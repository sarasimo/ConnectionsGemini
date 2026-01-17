///@description
game_mode = gm.full_game;

if AI_ACTIVE
{
    scr_request_puzzle();
	layer_set_visible("UI_loading", true);
    obj_button_start.isActive = false;
	exit;
}

//uses local puzzle for testing
event_user(0);