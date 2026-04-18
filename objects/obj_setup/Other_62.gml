///@description Get data

/* //Gemini response structure
 {
  "candidates": [
    {
      "content": {
        "parts": [
          {
            "text": "The generated response text goes here."
          }
        ],
        "role": "model"
      },
      "finishReason": "STOP",
      "index": 0,
      "safetyRatings": [
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

 */

var _size = ds_map_size(async_load);

var _key = ds_map_find_first(async_load);

for (var i = 0; i < _size; i++) 
{
    
    if (_key == "response_headers")
    {
        var _headers = ds_map_find_value(async_load, _key)
        var isCached = ds_map_find_value(_headers, "cf-aig-cache-status")
        show_debug_message($"Cached stat: {isCached}");
    }
    if (_key == "result") 
    {
        //show_debug_message("<Section {0}> {1} ",i, async_load[? _key]);
        layer_set_visible("UI_loading", false);
        
        
        var _returned = json_parse(async_load[? _key]);
        show_debug_message(_returned);
        if variable_struct_exists(_returned, "error")
        {
            show_debug_message(_returned.error.message);
            event_user(1);
            status = _returned.error.message
            exit;
        }
        
        //extract AI response
        var _str = _returned.candidates[0].content.parts[0].text;
        
        // Access usageMetadata
        if (variable_struct_exists(_returned, "usageMetadata")) 
        {
            var _meta = _returned.usageMetadata;
            var prompt_tokens = _meta.promptTokenCount
            var output_tokens = _meta.candidatesTokenCount;
            var total_tokens = _meta.totalTokenCount;
            
            show_debug_message($"Tokens spent \n Prompt:{prompt_tokens}, Output:{output_tokens} Total:{total_tokens}");
        }

        var _json = clean_up_response(_str);
        
        if (_json == noone) 
        {
            status = "Failed to find puzzle for the date chosen!"
            show_debug_message(status);
            event_user(1);
            exit;
        }
        //show_debug_message(_json);
        
        active_puzzle = json_parse(_json);
        
        /*
        #region Saves Generated puzzles to a file
            var _txtFile = "gemini_puzzles.txt";
            var _file = file_text_open_append(working_directory + _txtFile);  
            file_text_write_string(_file, "," + _str );
            file_text_close(_file);
         */
        #endregion
        
        event_user(0); //create
        
    }
    
    _key = ds_map_find_next(async_load, _key);
}

show_debug_message($"Cached stat: {isCached}")