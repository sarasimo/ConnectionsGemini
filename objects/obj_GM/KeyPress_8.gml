///@description Deselect all
show_debug_message($"ev {event_type} num {event_number}");


for (var i = 0; i < array_length(guess_cards); i++) 
    if (guess_words[i] != noone)
    {
    	guess_cards[i].selected = false;
        guess_cards[i] = noone;
        guess_words[i] = noone;
    }
