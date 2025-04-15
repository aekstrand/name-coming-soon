global.storm_timer += delta_time;
show_debug_message(global.storm_timer);
if(global.storm_timer > 30000000) {
	global.storm_location = (global.storm_location + 1) % 4;
	global.storm_timer = 0;
	if(global.storm_location == 0) {
		clear_biome(global.desert_items);
		spawn_desert();
	} else if(global.storm_location == 1) {
		clear_biome(global.marsh_items);
		spawn_marsh();
	} else if(global.storm_location == 2) {
		clear_biome(global.peaks_items);
		spawn_peaks();
	} else {
		clear_biome(global.volcano_items);
		spawn_volcano();
	}
}