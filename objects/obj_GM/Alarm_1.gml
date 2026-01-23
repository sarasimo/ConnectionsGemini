///@description Reveal Answers

var answer_cards = array_create(0);

if !category_isSolved[n]
{
    with (obj_card)
    {
        if (array_contains(active_puzzle[other.n].words, txt)) 
            array_push(answer_cards, id);
    }
    show_debug_message(answer_cards);
    category_color = n;
    array_foreach(answer_cards, reposition_matched_card);
    categories_found += 1;
}

if (n < array_length(category_isSolved)-1) 
{
    alarm[1] = GAME_SPEED*reveal_time;
    n++
}

