///@description Modify  min/max values

switch (obj_monthEntry.txt) 
{
	default: max_val = 31; 
    break;
    
    case 2: 
        if date_leap_year(date_selected) max_val = 29;
        else max_val = 28;
    break;
    
    case 4: case 9: case 11: max_val = 30;
    case 6: if (obj_yearEntry.txt == 2023) min_val = 12;
    break;

        
    
}

if (obj_yearEntry.txt == date_get_year(date_current) && obj_monthEntry.txt = date_get_month(date_current)) max_val = date_get_day(date_current);
//date.d = txt;