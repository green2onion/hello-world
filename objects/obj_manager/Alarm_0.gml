/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < 500; i++)
{
	var instance_x = random_range(20,room_width-20);
	var instance_y = random_range(400,room_height);
	if !instance_place(instance_x,instance_y,obj_clod)
	{
		instance_create_layer(instance_x,instance_y,"Instances",obj_clod);
		break;
	}
}