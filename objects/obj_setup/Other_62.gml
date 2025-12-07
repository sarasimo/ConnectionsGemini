///@description Get data

var _size = ds_map_size(async_load);

var _key = ds_map_find_first(async_load);

for (var i = 0; i < _size; i++) 
{
    if (_key == "result") 
    {
        show_debug_message("<Section {0}> {1} ",i, async_load[? _key]);
        
        var _returned = json_parse(async_load[? _key]);
        var _str = _returned.candidates[0].content.parts[0].text;
        
        _str = clean_up_response(_str)
        show_debug_message(_str);
        active_puzzle = json_decode(_str)
        
        _txtFile = "gemini_puzzles.txt";
        var _file = file_text_open_append(working_directory + _txtFile);  
        file_text_write_string(_file, "," + _str );
        file_text_close(_file);
        
        event_user(0); //create
        
    }
    
    _key = ds_map_find_next(async_load, _key);
}