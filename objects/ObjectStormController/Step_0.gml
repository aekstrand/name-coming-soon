global.storm_timer += delta_time;
if(global.storm_timer > 30000000) {
	global.storm_location = (global.storm_location + 1) % 4;
	global.storm_timer = 0;
	show_debug_message("Storm Changed!");
}