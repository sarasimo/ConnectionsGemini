///@description Make fields inactive

if (obj_dayEntry.txt == current_day && obj_monthEntry.txt == current_month && obj_yearEntry.txt = current_year)
        date_selected = date_current_datetime();
else 
    date_selected = date_create_datetime(obj_yearEntry.txt, obj_monthEntry.txt, obj_dayEntry.txt , 12,0,0);

show_debug_message($"d:{date_get_day(date_selected)} m: {date_get_month(date_selected)} y: {date_get_year(date_selected)}");

with (par_numEntry) 
{
    isActive = false;
    image_blend = c_gray;
}
