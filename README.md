##### Connections Gemini

Play the NYT puzzles with more control and generate puzzles at will

### About this project

I love playing NYT connections but I didn't like the interface very much, I wanted to be able to move the cards and layout my potential guesses before I submit so I created this project. 
- This project uses AI to get the solution of a puzzle from a specific day and uses it to create a fully playable game of connections 
- or Generate completely new AI puzzles
- It allows you to click and drag cards to any position on the grid
- Using the hint button colours a card starting with the easiest unsolved category (you get 1 hint per category like the original game)
- for those chasing the reverse rainbow you can use the scroll wheel to change a card's border colour

### How to play

# Main Menu
- On the landing page you can change the date by hovering over a field and using the scroll wheel to change the highlighted field. 
- Clicking on a field lets you to type the number instead. Invalid dates are automatically adjusted when the field is no longer active. 
- Click on Get NYT puzzle to play the puzzle from that chosen day.
- You can also use Generate New Puzzle for an AI generated puzzle.

# Game Screen
Once you choose a game mode a loading screen will appear while we wait for the AI to reply. This also include instructions on how to play. 
- Click and drag cards to change their position
- Click to select/deselect a card
- Right click removes selection
- Click the submit button to submit a guess
- Scroll change border colour (This feature is just to help you think)

### Editing the project

## Viewing the project files
- Download Gamemaker Studio - this is free.
- This project needs an GEMINI AI KEY. If you download the project you will have to go to the Scripts/API_key_macro and add your key there. 
- I used Gemini 2.5 because they have free keys but I believe you could use another AI model with minimal changes to the code. 
- If using another model go to Scripts/scr_AI and change the url on line 3 and possibly the header on line 7.

