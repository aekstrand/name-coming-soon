// todo: draw the actual gui

for(var i = 0; i < global.inventory_size; i++) {
	draw_sprite(global.inventory[i], 0, 50 + 100*i, 50);
}

draw_set_font(Font1)
if(global.draw_crafting) {
	// draw the crafting sprite here
	for(var i = 0; i < global.menu_size; i++) {
		draw_text(100, 100 + (i*50), global.recipe_text[global.menu][i][0]);
	}
}