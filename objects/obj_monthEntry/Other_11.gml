///@description Change min
switch (obj_yearEntry.txt) 
{
	default: min_val = 1; max_val = 12; break;
    case 2023: min_val = 6; max_val = 12; break;
    
}

if (obj_yearEntry.txt == current_year) max_val = date_get_month(date_current);


