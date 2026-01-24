///@description Get data

var _size = ds_map_size(async_load);

var _key = ds_map_find_first(async_load);

for (var i = 0; i < _size; i++) 
{
    if (_key == "result") 
    {
        //show_debug_message("<Section {0}> {1} ",i, async_load[? _key]);
        layer_set_visible("UI_loading", false);
        
        var _returned = json_parse(async_load[? _key]);
        var _str = _returned.candidates[0].content.parts[0].text;
        show_debug_message(_str);
        
        /*
        if !string_starts_with(_str, "```json")
        {
            event_user(1);
            exit;
        }
        */
        var _json = clean_up_response(_str);
        
        if (_json == noone) 
        {
            event_user(1);
            exit;
        }
        //show_debug_message(_json);
        
        active_puzzle = json_parse(_json);
        
        #region Saves Generated puzzle to a file
            var _txtFile = "gemini_puzzles.txt";
            var _file = file_text_open_append(working_directory + _txtFile);  
            file_text_write_string(_file, "," + _str );
            file_text_close(_file);
        #endregion
        
        
        event_user(0); //create
        
    }
    
    _key = ds_map_find_next(async_load, _key);
}