#macro AI_ACTIVE 1
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


/*
active_puzzle = [
  {
    "category": "LOOK WITH AWE",
    "words": ["GOGGLE", "MARVEL", "STARE", "WONDER"]
  },
  {
    "category": "ELECTRICITY TERMS",
    "words": ["AC", "DC", "POWER", "VOLTAGE"]
  },
  {
    "category": "UNEXPECTED WINNER",
    "words": ["DARK HORSE", "LONG SHOT", "SLEEPER", "UNDERDOG"]
  },
  {
    "category": "STARTS WITH A SODA NAME",
    "words": ["CRUSHWORTHY", "FANTAGRAPHICS", "FRESCADE", "PEPSINOGEN"]
  }
]

 /*
 *{ candidates : [ { content : { role : "model", parts : [ { text : "```json
[
  {
    "words": ["GOGGLE", "MARVEL", "STARE", "WONDER"],
    "category": "LOOK AT WITH AWE"
  },
  {
    "words": ["AC", "DC", "POWER", "VOLTAGE"],
    "category": "BASIC ELECTRICITY TERMS"
  },
  {
    "words": ["DARK HORSE", "LONG SHOT", "SLEEPER", "UNDERDOG"],
    "category": "UNEXPECTED WINNER"
  },
  {
    "words": ["CRUSHWORTHY", "FANTAGRAPHICS", "FRESCADE", "PEPSINOGEN"],
    "category": "STARTING WITH SODA BRANDS"
  }
]
```" } ] }, finishReason : "STOP", index : 0, "safetyRatings": [
        {
          "category": "HARM_CATEGORY_HARASSMENT",
          "probability": "NEGLIGIBLE"
        }
      ]
    }
  ],
  "usageMetadata": {
    "promptTokenCount": 10,
    "candidatesTokenCount": 20,
    "totalTokenCount": 30
  }
}