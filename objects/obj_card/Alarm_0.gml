///@description change colour

switch (col_index)
{
	default: image_blend = c_white; break;
	case 0: image_blend = col01; break;
	case 1: image_blend = col02; break;
	case 2: image_blend = col03; break;
	case 3: image_blend = col04; break;
	
    //case 5: image_blend = c_dkgrey; break;
        
}

alarm[1] = 0;
speed = 0;
x = last_x;
y = last_y;
//if (selected) image_blend = c_dkgray;