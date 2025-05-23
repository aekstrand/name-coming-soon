global.speed = 4;
global.can_walk = true;
global.xDir = 0;
global.yDir = 0;
global.maxHealth = 4;
global.health = global.maxHealth;
global.time = 0;
global.last_item = self;
global.item_id = -1;
global.emergency_boost = false;
global.debug_ids = ["Copper","Plant Matter (Wood)","Sulphur","Quartz","Aluminum","Clay","Lithium","Oil","Platinum","Uranium","Diamond","Gold"];
global.sprite_ids = [SpriteCopper,SpriteWood,SpriteSulphur,SpriteQuartz,SpriteBauxite,SpriteClay,SpriteLithium,SpriteOil,SpritePlatinum,SpriteUranium,SpriteDiamond,SpriteGold];
global.resources_in_inventory = [0,0,0,0,0,0,0,0,0,0,0,0];
global.resources_in_base = [0,0,0,0,0,0,0,0,0,0,0,0];
global.timeSinceDrivingSound = 0;

//legacy variables just in case
//global.bauxite_in_inventory = 0;
//global.clay_in_inventory = 0;
//global.copper_in_inventory = 0;
//global.diamond_in_inventory = 0;
//global.gold_in_inventory = 0;
//global.junk_in_inventory = 0;
//global.lithium_in_inventory = 0;
//global.oil_in_inventory = 0;
//global.platinum_in_inventory = 0;
//global.quartz_in_inventory = 0;
//global.sulphur_in_inventory = 0;
//global.uranium_in_inventory = 0;
//global.wood_in_inventory = 0;
//global.bauxite_in_base = 0;
//global.clay_in_base = 0;
//global.copper_in_base = 0;
//global.diamond_in_base = 0;
//global.gold_in_base = 0;
//global.junk_in_base = 0;
//global.lithium_in_base = 0;
//global.oil_in_base = 0;
//global.platinum_in_base = 0;
//global.quartz_in_base = 0;
//global.sulphur_in_base = 0;
//global.uranium_in_base = 0;
//global.wood_in_base = 0;

global.inventory = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
global.max_inventory = 6;
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
	["Improved Treads","Increases movement speed"],
	["Ion Siphon","Increases the amount of charge gained by batteries"],
	["Reflective Signal Focus","Speeds up scanning resources"],
	["Hazard-Shielded Reactor","Decreases battery drain"],
	["Optimized Storage Module","Increases held inventory size"],
	["High Voltage Battery Pack","Allows battery to overcharge"],
	["Resource Radar","Increases the number of resources to scan"],
	["Emergency Boost","Press E for a short boost of speed"],
],
[
	["Salvaged Components","Cobble together the remains of your rocket"],
	["Rocket Platform","Set up braces and scaffolding for the rocket"],
	["Engines","Upgrade the engine to gain enough power to break orbit"],
	["Atmospheric Shielding","Encase the rocket with metal that can withstand space launch"],
	["Navigation Systems","Program a computer to take you home"],
	["ERROR: This should not be visible!","null"],
	["ERROR: This should not be visible!","null"],
	["ERROR: This should not be visible!","null"],
]];

//  [c,p,s,q,a,c,l,o,p,u,d,g]
global.recipe_cost = [
[
	[0,0,2,0,0,0,0,1,0,0,0,0],
	[0,2,0,0,1,0,0,0,0,0,0,0],
	[1,1,0,2,0,0,0,0,0,0,0,0],
	[2,0,0,0,0,0,1,0,0,0,0,0],
	[0,1,0,0,1,0,0,1,0,0,0,1],
	[1,0,0,0,0,0,1,0,0,0,1,0],
	[0,0,0,1,0,0,1,0,1,0,0,0],
	[0,0,2,0,0,0,0,1,0,1,0,0],
],
[
	[1,1,1,1,0,0,0,0,0,0,0,0],
	[0,2,0,0,1,2,0,0,0,0,0,0],
	[0,0,2,0,0,0,0,1,0,2,0,0],
	[0,0,0,2,1,0,0,1,2,0,0,0],
	[2,0,0,0,0,0,2,0,0,0,2,2],
	[0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0],
]];
global.recipes_completed = [
[false,false,false,false,false,false,false,false],
[false,false,false,false,false]
];
global.can_craft = false;

global.takeDamage = function(damage) {
	global.health -= damage;
	if (random(2) > 1) {
		audio_play_sound(sndRobotHit1, 0, false);
	} else {
		audio_play_sound(sndRobotHit2, 0, false);
	}
	
}