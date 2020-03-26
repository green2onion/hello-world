/// @description Insert description here
// You can write your code in this editor

// y movement
if is_falling
{
	delta_time_y += delta_time/1000000;
	velocity_y = 20*delta_time_y;
	y += velocity_y;
}

if y > room_height
{
	instance_destroy();
}