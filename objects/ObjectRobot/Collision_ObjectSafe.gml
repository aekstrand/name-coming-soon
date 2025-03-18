if(global.wood_in_inventory > 0) {
	global.wood_in_base += global.wood_in_inventory;
	global.wood_in_inventory = 0;
	show_debug_message("Wood stored!");
	show_debug_message(global.wood_in_base);
}
global.time = 0;