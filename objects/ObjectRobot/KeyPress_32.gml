// INTERACT BUTTON
// Check if still near item
if(instance_exists(global.last_item) && global.last_item.id != self.id) {
	if(sqrt(power(x-global.last_item.id.x, 2) + power(y-global.last_item.id.y, 2)) < 100 && global.can_walk) {
		global.can_walk = false; //pauses the player while picking up item
		alarm[8] = 40;
		if(global.last_item.object_index == ObjectBattery) {
			global.health += 1;
		} else if(global.last_item.object_index == ObjectBauxite) {
			global.bauxite_in_inventory += 1;
		} else if(global.last_item.object_index == ObjectClay) {
			global.clay_in_inventory += 1;
		} else if(global.last_item.object_index == ObjectCopper) {
			global.copper_in_inventory += 1;
		} else if(global.last_item.object_index == ObjectDiamond) {
			global.diamond_in_inventory += 1;
		} else if(global.last_item.object_index == ObjectGold) {
			global.gold_in_inventory += 1;
		} else if(global.last_item.object_index == ObjectJunk) {
			global.junk_in_inventory += 1;
		} else if(global.last_item.object_index == ObjectLithium) {
			global.lithium_in_inventory += 1;
		} else if(global.last_item.object_index == ObjectOil) {
			global.oil_in_inventory += 1;
		} else if(global.last_item.object_index == ObjectPlatinum) {
			global.platinum_in_inventory += 1;
		} else if(global.last_item.object_index == ObjectQuartz) {
			global.quartz_in_inventory += 1;
		} else if(global.last_item.object_index == ObjectSulphur) {
			global.sulphur_in_inventory += 1;
		} else if(global.last_item.object_index == ObjectUranium) {
			global.uranium_in_inventory += 1;
		} else if(global.last_item.object_index == ObjectWood) {
			global.wood_in_inventory += 1;
		}
		instance_destroy(global.last_item.id);
		global.last_item = self;
	} else {
		global.last_item = self;
	}
}