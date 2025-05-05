if(global.inventory_size > 0) {
	for(var i = 0; i < 12; i++) {
		global.resources_in_base[i] += global.resources_in_inventory[i];
	}
}
global.resources_in_inventory = [0,0,0,0,0,0,0,0,0,0,0,0];
global.inventory = [0, 0, 0, 0, 0, 0];
global.inventory_size = 0;
global.time = 0;
global.health = global.maxHealth;
global.can_boost = true;