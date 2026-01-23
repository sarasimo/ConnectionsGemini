#macro AI_ACTIVE false
#macro GAME_SPEED  game_get_speed(gamespeed_fps)

PUZZLE_TEMPLATE = [
    {
        category : "CATEGORY1 NAME",
        words : ["WORD1", "WORD2", "WORD3", "WORD4" ]
    },
    {
        category : "CATEGORY2 NAME",
        words : ["WORD1", "WORD2", "WORD3", "WORD4" ]
    },
    {
        category : "CATEGORY3 NAME",
        words : ["WORD1", "WORD2", "WORD3", "WORD4" ]
    },
    {
        category : "CATEGORY4 NAME",
        words : ["WORD1", "WORD2", "WORD3", "WORD4" ]
    },
]

globalvar date_selected, date_current, word_array, active_puzzle, game_mode;

date_current  = date_current_datetime();

word_array = [];

active_puzzle = [
  {
    "category": "Desk Items",
    "words": ["PEN", "PAPER", "CHAIR", "MONITOR"]
  },
  {
    "category": "Things That Spin",
    "words": ["TOP", "WHEEL", "FAN", "GLOBE"]
  },
  {
    "category": "Words That Follow \"Sea\"",
    "words": ["SALT", "SHELL", "WEED", "HORSE"]
  },
  {
    "category": "Types of Waves",
    "words": ["SOUND", "HEAT", "SHOCK", "SINE"]
  }
]

enum gm 
{ 
    ai_game, nyt_companion, manual_entry
}

game_mode = gm.ai_game;

enum card_img
{
    black, yellow, green, blue, purple, white, gray,
}

enum M
{
    jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec
}

