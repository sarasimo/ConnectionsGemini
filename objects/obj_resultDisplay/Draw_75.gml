///@description 
var _x = inst_board.x + margin;
var _y = inst_board.y + margin;

for (var pg = 0; pg < array_length(prev_guesses); pg++) 
{
	for (var w = 0; w < array_length(prev_guesses[pg]); w++) 
    {
    	for (var c = 0; c < array_length(active_puzzle); c++)
        {
            if array_contains(active_puzzle[c].words, prev_guesses[pg][w])
            {
                draw_sprite_stretched(spr_resultSquare, c, _x,_y, cell_size, cell_size)
                _x += cell_size ;
            }
        }
    }
    
    _x = inst_board.x + margin;
    _y += cell_size + 4//sprite_get_width(spr_resultSquare) + 4 ;
}
 