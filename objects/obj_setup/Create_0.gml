///@description Prompt AI
var _prompt;

var day = date_get_day(date_selected);
var month = date_get_month(date_selected);
var year = date_get_year(date_selected);

if AI_ACTIVE
{
    randomise();
    switch (game_mode)
    {
        case gm.ai_game: 
        _prompt = "You are generating content for a game inspired by the NYT game Connections." +
                "\n You need to create 4 categories each containing 4 different words/concepts." +
                "\n The same words should never appear in more than 1 group." +
                "\n Words/Concepts in this case can be single words, hyphyinated words and 2 word phrases like -shut up or come on" +
                "\n Each category should get slightly more challenging than the one prior." +
                //"\n Categories can be made up of homophones, synonyms, trivia, words hidden within longer words ect" +
                "\n Optionally increase difficulty by including red herrings ie words from different group that look like they can be in the same category" +
                "\n Response should be formated as follows \n" + json_stringify(global.PUZZLE_TEMPLATE);
        break;
        
        case gm.nyt_companion:
        _prompt = "You are genarating a json for a program that will give extra hints to the NYT Game connections." +
        $" Provide the solution of the NYT game Connections for day:{day} month:{month} year: {year}" +
                    "\n Response should be formated as follows \n" + json_stringify(global.PUZZLE_TEMPLATE);
        break;
        
        //test prompt
        case 5: _prompt = "what is the date today?"
    }
    
    
    scr_request_puzzle(_prompt);
	layer_set_visible("UI_loading", true);
    obj_button_start.isActive = false;
	exit;
}

//uses local puzzle for testing
event_user(0); 