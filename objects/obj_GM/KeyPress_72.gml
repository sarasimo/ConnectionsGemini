///@description Reveal hint

show_debug_message($"ev {event_type} num {event_number}, {category_hintShown}");

//finds a category that has not been solved or given a hint
var _category = array_get_index(category_hintShown, false);
if (_category == -1) exit;

var _hint = active_puzzle[_category].words[0];
hints_used += 1;
category_hintShown[_category] = true;

if (!instance_exists(obj_card)) exit;

var _n = instance_number(obj_card);
for (var i = 0; i < _n; i++) 
{
    var _inst = instance_find(obj_card, i);
    if (_inst.txt == _hint) with (_inst)
    {
        col_index = _category;
        alarm[0] = 1;
        show_debug_message($" lvl {_category} word {_hint}")
        exit;
    }
}


/*
if (instance_exists(obj_banner))
{
    var _n = instance_number(obj_banner);
    for (var i = 0; i < _n; i++) 
    {
    	var _inst = instance_find(obj_banner, i);
        category_hintShown[_inst.col_index] = false;
    }
}