///@description
game_mode = gm.full_game;

if AI_ACTIVE
{
    scr_request_puzzle();
	layer_set_visible("UI_loading", true);
	exit;
}

//uses local puzzle
event_user(0);