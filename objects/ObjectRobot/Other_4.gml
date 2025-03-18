global.speed = 3;
global.xDir = 0;
global.yDir = 0;
global.health = 4;
global.time = 0;
global.last_item = self;
global.wood_in_inventory = 0;
global.wood_in_base = 0;
sprite_index = SpriteRobotFront;
for(var i = 0; i < 1000; i++) {
	instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectWood);
	if(i % 10) instance_create_layer(random_range(0, room_width), random_range(0, room_height), "Instances", ObjectBattery);
}