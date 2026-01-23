///@description shake
//if alarm[0] <= 0 exit;
show_debug_message($"dir {direction}");
switch direction
{
    case 0: direction = 180; break;
    case 180: direction = 0; break;
    case 90: direction = 270; break;
    case 270: direction = 90; break;
}

alarm[1] = 5;

