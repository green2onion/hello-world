/// @description Insert description here
// You can write your code in this editor
ini_open("tuning.ini");
global.gravity = ini_read_real("gameplay","gravity",.2)
ini_close()



randomize();
image_index = image_number-1;
image_speed = 0;
for (var i = 0; i < 20; i++)
{
	for (var j = 0; j < 500; j++)
	{
		var instance_x = random_range(20,room_width-20);
		var instance_y = random_range(400,room_height);
		if !instance_place(instance_x,instance_y,obj_clod)
		{
			instance_create_layer(instance_x,instance_y,"Instances",obj_clod);
			break;
		}
	}
}