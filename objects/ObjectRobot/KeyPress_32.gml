// INTERACT BUTTON
// Check if still near item
if(global.last_item.id != self.id) {
	if(sqrt(power(x-global.last_item.id.x, 2) + power(y-global.last_item.id.y, 2)) < 100) {
		if(global.last_item.object_index == ObjectBattery) {
			global.health += 1;
		} else if(global.last_item.object_index == ObjectWood) {
			global.wood_in_inventory += 1;
		}
		instance_destroy(global.last_item.id);
		global.last_item = self;
	} else {
		global.last_item = self;
	}
}