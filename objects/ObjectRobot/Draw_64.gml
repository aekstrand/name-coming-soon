// todo: draw the actual gui

for(var i = 0; i < global.inventory_size; i++) {
	draw_sprite(global.inventory[i], 0, 50 + 100*i, 50);
}

// not sure how to actually draw gui, but pseudocode below:

// if(global.draw_crafting) {
// [draw crafting interface]
// [highlight the recipe that corresponds to global.menu_index]
// }