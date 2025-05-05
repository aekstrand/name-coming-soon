if(global.draw_crafting && global.can_craft) {
	for(var i = 0; i < 12; i++) {
		global.resources_in_base[i] -= global.recipe_cost[global.menu][global.menu_index][i];
	}
	global.recipes_completed[global.menu][global.menu_index] = true;
} else if(global.recipes_completed[0][7] && global.can_boost) {
	global.emergency_boost = true;
	global.can_boost = false;
	alarm[9] = 100;
}