// INTERACT BUTTON
// Check if still near item
if(instance_exists(global.last_item) && global.last_item.id != self.id) {
	if(sqrt(power(x-global.last_item.id.x, 2) + power(y-global.last_item.id.y, 2)) < 100 && (global.can_walk || global.draw_crafting)) {
		if(global.last_item.object_index == ObjectCraftingTable) {
			global.menu = 0;
			global.menu_size = 8;
			global.menu_index = 0;
			global.draw_crafting = !global.draw_crafting;
			global.can_walk = !global.can_walk;
		} else if(global.last_item.object_index == ObjectRocket) {
			global.menu = 1;
			global.menu_size = 5;
			global.menu_index = 0;
			global.draw_crafting = !global.draw_crafting;
			global.can_walk = !global.can_walk;
		} else if(global.last_item.object_index == ObjectBattery) {
			pickupItem(true);
			if(global.recipes_completed[0][1]) {
				global.health += 4;
			} else {
				global.health += 2;
			}
			if(!global.recipes_completed[0][5] && global.health > global.maxHealth) {
				global.health = global.maxHealth;
			}
			audio_play_sound(sndRecharge, 0, false);
		} else if(global.item_id != -1 && global.inventory_size < global.max_inventory) {
			global.resources_in_inventory[global.item_id] += 1;
			global.inventory_size += 1;
			global.inventory[global.inventory_size - 1] = global.last_item.id.sprite_index;
			pickupItem(false);
			global.item_id = -1;
			
			//legacy code just in case
			//if(global.last_item.object_index == ObjectBauxite) {
			//	global.bauxite_in_inventory += 1;
			//} else if(global.last_item.object_index == ObjectClay) {
			//	global.clay_in_inventory += 1;
			//} else if(global.last_item.object_index == ObjectCopper) {
			//	global.copper_in_inventory += 1;
			//} else if(global.last_item.object_index == ObjectDiamond) {
			//	global.diamond_in_inventory += 1;
			//} else if(global.last_item.object_index == ObjectGold) {
			//	global.gold_in_inventory += 1;
			//} else if(global.last_item.object_index == ObjectJunk) {
			//	global.junk_in_inventory += 1;
			//} else if(global.last_item.object_index == ObjectLithium) {
			//	global.lithium_in_inventory += 1;
			//} else if(global.last_item.object_index == ObjectOil) {
			//	global.oil_in_inventory += 1;
			//} else if(global.last_item.object_index == ObjectPlatinum) {
			//	global.platinum_in_inventory += 1;
			//} else if(global.last_item.object_index == ObjectQuartz) {
			//	global.quartz_in_inventory += 1;
			//} else if(global.last_item.object_index == ObjectSulphur) {
			//	global.sulphur_in_inventory += 1;
			//} else if(global.last_item.object_index == ObjectUranium) {
			//	global.uranium_in_inventory += 1;
			//} else if(global.last_item.object_index == ObjectWood) {
			//	global.wood_in_inventory += 1;
			//}
		}
	} else {
		global.last_item = self;
	}
}

function pickupItem(skipNoise) {
	global.can_walk = false; //pauses the player while picking up item
	if(global.recipes_completed[0][2]) {
		alarm[8] = 20;
	} else {
		alarm[8] = 40;
	}
	if (!skipNoise) {
		audio_play_sound(sndScan, 0, false);	
	}
	instance_destroy(global.last_item.id);
	global.last_item = self;
}

