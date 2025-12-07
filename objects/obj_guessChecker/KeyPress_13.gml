///@description
if (array_get_index(guess_words, noone))
{
    var _str = "Select 4 words before submitting";
    show_debug_message(_str);
    exit;
}


#region Check user submission against categories
    
    
show_debug_message("guesses {0}", guess_words);   
#endregion    
