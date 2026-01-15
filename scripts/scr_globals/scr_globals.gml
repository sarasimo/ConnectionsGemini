#macro AI_ACTIVE false
#macro GAME_SPEED  game_get_speed(gamespeed_fps)

PUZZLE_TEMPLATE = [
    {
        category : "category1 name",
        words : ["word1", "word2", "word3", "word4" ]
    },
    {
        category : "category2 name",
        words : ["word1", "word2", "word3", "word4" ]
    },
    {
        category : "category3 name",
        words : ["word1", "word2", "word3", "word4" ]
    },
    {
        category : "category4 name",
        words : ["word1", "word2", "word3", "word4" ]
    },
]

globalvar word_array, active_puzzle, game_mode; 

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
    full_game, nyt_companion
}

game_mode = gm.full_game;

enum card_img
{
    black, yellow, green, blue, purple, white, gray,
}