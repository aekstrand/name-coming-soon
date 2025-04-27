global.speed = 3;
global.can_walk = true;
global.xDir = 0;
global.yDir = 0;
global.health = 4;
global.time = 0;
global.last_item = self;
global.bauxite_in_inventory = 0;   //yknow if this were a fully-fledged game it would be way better to convert this to a series of arrays
global.clay_in_inventory = 0;      //but honestly at this point doing that isn't worth it
global.copper_in_inventory = 0;
global.diamond_in_inventory = 0;
global.gold_in_inventory = 0;
global.junk_in_inventory = 0;
global.lithium_in_inventory = 0;
global.oil_in_inventory = 0;
global.platinum_in_inventory = 0;
global.quartz_in_inventory = 0;
global.sulphur_in_inventory = 0;
global.uranium_in_inventory = 0;
global.wood_in_inventory = 0;
global.bauxite_in_base = 0;
global.clay_in_base = 0;
global.copper_in_base = 0;
global.diamond_in_base = 0;
global.gold_in_base = 0;
global.junk_in_base = 0;
global.lithium_in_base = 0;
global.oil_in_base = 0;
global.platinum_in_base = 0;
global.quartz_in_base = 0;
global.sulphur_in_base = 0;
global.uranium_in_base = 0;
global.wood_in_base = 0;
global.inventory = [0, 0, 0, 0, 0, 0];
global.inventory_size = 0; //in the future, may be useful for "scrolling through" your inventory
global.menu = 0;
global.menu_size = 8;
global.menu_index = 0;
global.draw_crafting = false;
sprite_index = SpriteRobotFront;
/*for(var i = 0; i < 1000; i++) {
	instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectBauxite);
	instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectClay);
	instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectCopper);
	instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectDiamond);
	instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectGold);
	instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectJunk);
	instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectLithium);
	instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectOil);
	instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectPlatinum);
	instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectQuartz);
	instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectSulphur);
	instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectUranium);
	instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectWood);
	if(i % 10) instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectBattery);
}*/
//instance_create_layer(10000, 10000, "Instances", ObjectWood);

global.recipe_text = [
[
	["Improved Treads",""],
	["Ion Siphon",""],
	["Reflective Signal Focus",""],
	["Hazard-Shielded Reactor",""],
	["Optimized Storage Module",""],
	["Enemy Radar",""],
	["Resource Radar",""],
	["Emergency Boost",""],
],
[
	["Salvaged Components",""],
	["Rocket Platform",""],
	["Engines",""],
	["Atmospheric Shielding",""],
	["Navigation Systems",""],
	["ERROR: This should not be visible!","null"],
	["ERROR: This should not be visible!","null"],
	["ERROR: This should not be visible!","null"],
]]