if(global.draw_crafting && global.menu_index < global.menu_size - 1) {
	global.menu_index += 1;
	audio_play_sound(sndChangeRecipes, 0, false);
}