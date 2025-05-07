if(global.draw_crafting && global.menu_index > 0) {
	global.menu_index -= 1;
	audio_play_sound(sndChangeRecipes, 0, false);
}