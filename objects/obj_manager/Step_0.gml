/// @description Insert description here
// You can write your code in this editor
if instance_number(obj_clod)<30
{
	if alarm[0] <= 0
	{
		alarm[0] = 1*room_speed;
	}	
}

// camera 
var cam_y;
if (obj_player_left.y < room_height && !obj_player_left.dead) && (obj_player_right.y < room_height && !obj_player_right.dead)
{
	cam_y = (obj_player_left.y + obj_player_right.y)/2;
}
else if obj_player_left.y < room_height && !obj_player_left.dead
{
	cam_y = obj_player_left.y;
}
else if (obj_player_right.y < room_height && !obj_player_right.dead)
{
	cam_y = obj_player_right.y;
}
else
{
	cam_y = room_height/2;
}
var cheight = camera_get_view_height(view_camera[0]);
var cam_x = 0;
var cam_y_larp = clamp(0,room_height,lerp(camera_get_view_y(view_camera[0]),cam_y-cheight/2,0.1));
camera_set_view_pos(view_camera[0],cam_x,cam_y_larp);
