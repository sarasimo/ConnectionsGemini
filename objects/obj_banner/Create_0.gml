///@description manage strings
event_inherited();

category = string_upper(category);
words_str = string_replace(words, "[", "");
words_str = string_replace_all(words_str, "\"", " ");
words_str = string_replace_all(words_str, "]", "");

