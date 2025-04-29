// todo: draw the actual gui

for(var i = 0; i < global.inventory_size; i++) {
	draw_sprite(global.inventory[i], 0, 50 + 100*i, 50);
}

draw_set_font(Font1)
if(global.draw_crafting) {
	for(var i = 0; i < global.menu_size; i++) {
		draw_text(100, 100 + (i*50), global.recipe_text[global.menu][i][0]);
	}
	
	draw_text_transformed(1250, 500, global.recipe_text[global.menu][global.menu_index][0], 2, 2, 0);
	draw_text(1250, 550, global.recipe_text[global.menu][global.menu_index][1]);
	var j = 0;
	var has_mats = true;
	for(var i = 0; i < 12; i++) {
		if(global.recipe_cost[global.menu][global.menu_index][i] > 0) {
			draw_text(1250, 600 + (j*50), string_concat(global.resources_in_base[i],"/",global.recipe_cost[global.menu][global.menu_index][i]));
			draw_sprite(global.sprite_ids[i], 0, 1300, 600 + (j*50));
			j++;
			if(global.resources_in_base[i] < global.recipe_cost[global.menu][global.menu_index][i]) {
				has_mats = false;
			}
		}
	}
	if(global.recipes_completed[global.menu][global.menu_index]) {
		draw_text(1250, 600 + (j*50), "Successfully crafted!");
		global.can_craft = false;
	} else if(!has_mats) {
		draw_text(1250, 600 + (j*50), "Not enough materials!");
		global.can_craft = false;
	} else if(global.menu == 1 && global.menu_index > 0 && !global.recipes_completed[1][global.menu_index-1]) {
		draw_text(1250, 600 + (j*50), "You must build the previous stage first.");
		global.can_craft = false;
	} else {
		draw_text(1250, 600 + (j*50), "Press E to craft");
		global.can_craft = true;
	}
}