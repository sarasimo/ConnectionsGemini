## Connections Gemini

Play the NYT puzzles with more control and generate puzzles at will

### About this project

I love playing NYT connections but I didn't like the interface very much, I wanted to be able to move the cards and layout my potential guesses before I submit so I created this project. 
- This project uses AI to get the solution of a puzzle from a specific day and uses it to create a fully playable game of connections 
- or Generate completely new AI puzzles
- It allows you to click and drag cards to any position on the grid
- Using the hint button colours a card starting with the easiest unsolved category (you get 1 hint per category like the original game)
- for those chasing the reverse rainbow you can use the scroll wheel to change a card's border colour

### How to play
- Go to https://sarasimo.github.io/ConnectionsGemini/ 

#### Main Menu
- On the landing page you can change the date by hovering over a field and using the scroll wheel to change the highlighted field. 
- Clicking on a field lets you to type the number instead. Invalid dates are automatically adjusted when the field is no longer active. 
- Click on Get NYT puzzle to play the puzzle from that chosen day.
- You can also use Generate New Puzzle for an AI generated puzzle.
- **Note** Occationally the model is too busy and cause an error especially on weekends

#### Game Screen
Once you choose a game mode a loading screen will appear while we wait for the AI to reply. This also include instructions on how to play. 
- Click and drag cards to change their position
- Click to select/deselect a card
- Right click removes selection
- Click the submit button to submit a guess
- Scroll change border colour (This feature is just to help you think)

### Downloading the project itself

#### Viewing and editing project files
- Download Gamemaker Studio - free version is fine.
- This project works by making API requests.
- In order to make the html vesrion of the game available online I used a cloudfare AI worker and an AI gate to hide my Google Gemini key.
- The request ultimately gets processed by Gemini 2.5

##### Want to incorporate AI into your Gamemaker project.
###### These are the main files you need to look at
- **Scripts/scr_AI** - contains the **scr_request_puzzle()** function that creates and sends the Http request
- **obj_setup:** Defines prompts, calls request function and **Async-HTTP event** processes the response from or request

###### Adapting code for a different model
- Get the cURL example template for your model
- In Gamemaker create headers (-H) with ds_map_add()
- Note that Multiple headers might be needed for your request
- Change var _url to one shown next to the word curl
- Change var _data to match your example data field (-d) mine is formatted accoring to Gemini's but ChatGTP uses a sligtly different format
- The structure of the response you get may also vary. 

```

```

