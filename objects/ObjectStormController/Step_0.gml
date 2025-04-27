//show_debug_message("array length for cull: " + string(array_length(global.emitterArray)));
if (!is_array(global.emitterArray)) {
    show_debug_message("!! emitterArray is not an array in Step");
} else {
//    show_debug_message(">> Step: emitterArray length: " + string(array_length(global.emitterArray)));
}
//show_debug_message("array length5: " + string(array_length(global.emitterArray)));
// sorry if that's important it was clogging up the debug log

global.storm_timer += delta_time;
//show_debug_message(global.storm_timer);
if(global.storm_timer > 30000000) {
	global.storm_location = (global.storm_location + 1) % 4;
	global.storm_timer = 0;
	if(global.storm_location == 0) { //up
		clear_biome(global.desert_items);
		spawn_desert();
	} else if(global.storm_location == 1) { //left
		clear_biome(global.marsh_items);
		spawn_marsh();
	} else if(global.storm_location == 2) { //down
		clear_biome(global.peaks_items);
		spawn_peaks();
	} else {
		clear_biome(global.volcano_items); //right
		spawn_volcano();
	}
	move_storm_particles();
}

//show_debug_message("array length for cull: " + string(array_length(global.emitterArray)));
array_foreach(global.emitterArray, function(value) {
	var renderDistance = 2000;
	if (is_struct(value)) {
		if (value.id >= 0 && part_emitter_exists(global.ps, value.id)) {
			if (point_distance(value.x, value.y, ObjectRobot.x, ObjectRobot.y) > renderDistance && value.active) {
				part_emitter_stream(global.ps, value.id, value.type, 0);
				show_debug_message("disabled");
				value.active = false;
			} else if (point_distance(value.x, value.y, ObjectRobot.x, ObjectRobot.y) < renderDistance && !value.active) {
				part_emitter_stream(global.ps, value.id, value.type, value.particlesPerStep);
				value.active = true;
			}
		} else {
			show_debug_message("Emitter isn't valid: " + string(value));
		}
	}
});