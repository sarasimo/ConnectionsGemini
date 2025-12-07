if (!isActive)
{
    image_alpha = 0.6;
}
else image_alpha = 1;

if collision_point(mouse_x,mouse_y, self,0,0)
{
    image_blend = c_aqua;
	if (!isActive)image_blend = c_ltgray
}
else
{
    image_blend = c_white;
}