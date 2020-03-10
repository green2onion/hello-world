/// @description Insert description here
// You can write your code in this editor
draw_set_font(font0);
draw_set_halign(fa_left);
draw_set_color(c_green);
draw_text(100, 32, string(obj_player_left.my_score));
draw_set_halign(fa_right);
draw_set_color(c_red);
draw_text(room_width - 100, 32, string(obj_player_right.my_score));