if(global.draw_crafting) {
	if (global.can_craft) {
		for(var i = 0; i < 12; i++) {
			global.resources_in_base[i] -= global.recipe_cost[global.menu][global.menu_index][i];
		}
		audio_play_sound(sndCraft, 0, false);
		global.recipes_completed[global.menu][global.menu_index] = true;
	} else {
		audio_play_sound(sndCraftingFailed, 0, false);
	}	
} else if(global.recipes_completed[0][7] && global.can_boost) {
	global.emergency_boost = true;
	global.can_boost = false;
	alarm[9] = 100;
}