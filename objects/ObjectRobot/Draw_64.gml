// todo: draw the actual gui

for(var i = 0; i < global.inventory_size; i++) {
	draw_sprite(global.inventory[i], 0, 50 + 100*i, 50);
}

draw_set_font(Font1)
if(global.draw_crafting) {
	for(var i = 0; i < global.menu_size; i++) {
		draw_text(100, 100 + (i*50), global.recipe_text[global.menu][i][0]);
	}
	
	draw_text(1250, 500, global.recipe_text[global.menu][global.menu_index][0]);
	draw_text(1250, 550, global.recipe_text[global.menu][global.menu_index][1]);
	var j = 0;
	for(var i = 0; i < 12; i++) {
		if(global.recipe_cost[global.menu][global.menu_index][i] > 0) {
			draw_text(1250, 600 + (j*50), string_concat(global.resources_in_base[i],"/",global.recipe_cost[global.menu][global.menu_index][i]));
			draw_sprite(global.sprite_ids[i], 0, 1300, 600 + (j*50));
			j++;
		}
	}
}