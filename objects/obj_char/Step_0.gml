/// @description Insert description here
// You can write your code in this editor

// y movement
delta_time_y += delta_time/1000000;
velocity_y = initial_velocity_y + accel_y*delta_time_y;
velocity_y = clamp(velocity_y, -50,50);
for (var i = 1; i < abs(round(velocity_y)); i++)
{
	var clod = instance_place(x,y+sign(velocity_y),obj_clod);
	if clod != noone
	{
		if velocity_y > 0 && !place_meeting(x, y, clod) && !dead
		{
			initial_velocity_y = -40;
			delta_time_y = 0;
			effect_create_below(ef_explosion,clod.x,clod.y,1,c_white);
			var clod_size = floor(clod.image_index);
			if clod_size == 0
			{
				clod.sprite_index = spr_clod_boom_1;
			}
			else if clod_size == 1
			{
				clod.sprite_index = spr_clod_boom_2;
			}
			else if clod_size == 2
			{
				clod.sprite_index = spr_clod_boom_3;
			}
			clod.image_index = 0;
			clod.image_speed = 3;
			//instance_destroy(clod);
		}
	}
	var char = instance_place(x,y+sign(velocity_y),obj_char);
	if char != noone
	{
		if y<char.y && !place_meeting(x, y, char)
		{
			my_score++;
			initial_velocity_y = -40;
			delta_time_y = 0;
			effect_create_below(ef_star,x+2,y+sign(velocity_y)+2,2,c_yellow);
			effect_create_below(ef_star,x-2,y+sign(velocity_y)-2,2,c_yellow);
			char.dead = true;
			
		}
	}
	y += sign(velocity_y);
}

// x movement
var move_x = keyboard_check(input_right) - keyboard_check(input_left);
if move_x != 0
{
	delta_time_x += delta_time/1000000;
}
else
{
	delta_time_x = 0;
	initial_velocity_x = velocity_x;
}

accel_x = move_x * acc_multiplier; // sideway velocity multiplier
velocity_x = initial_velocity_x + accel_x*delta_time_x;
if abs(velocity_x - sign(velocity_x)*(resist_x/room_speed)) < 1
{
	velocity_x = 0;
}
else
{
	velocity_x -= sign(velocity_x)*(resist_x/room_speed);
}

velocity_x = clamp(velocity_x,-20,20);



//x bounce and move
for (var i = 1; i < abs(round(velocity_x)); i++) 
{
	if (x+sign(velocity_x)*i >= room_width - sprite_width/2) 
	{ 
		velocity_x *= -1; 
	} 
	else if (x+sign(velocity_x)*i <= sprite_width/2) 
	{
		velocity_x *= -1; 
	}
	if !dead
	{
		x += sign(velocity_x);
	}
	
}


if round(velocity_y) == 0
{
	var height_max = room_height - y;
	show_debug_message("max height = "+ string(height_max));
	show_debug_message("vel_y = "+ string(velocity_y));
	show_debug_message("initial_velocity_y = "+ string(delta_time_y));
}
// respawn
if y > room_height
{
	effect_create_above(ef_star,x,y,2,c_yellow);
	if alarm[0] <= 0
	{
		my_score--;
		alarm[0] = 3*room_speed;
	}
}
// dead and animation
if dead
{
	sprite_index = spr_oof;
	depth = -9999;
}
else
{
	if y > 0
	{
		depth = -y;
	}
	
	if velocity_y > 0
	{
		sprite_index = spr_down;
	}
	else
	{
		sprite_index = spr_up;
	}
}