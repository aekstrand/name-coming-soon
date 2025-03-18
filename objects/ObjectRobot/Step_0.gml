var xDir = 0;
var yDir = 0;

if(keyboard_check(ord("A"))) {
	xDir = -global.speed;
	sprite_index = SpriteRobotLeft;
} else if(keyboard_check(ord("D"))) {
	xDir = global.speed;
	sprite_index = SpriteRobotRight;
}
if(keyboard_check(ord("W"))) {
	yDir = -global.speed;
	sprite_index = SpriteRobotBack;
} else if(keyboard_check(ord("S"))) {
	yDir = global.speed;
	sprite_index = SpriteRobotFront;
}

/* Uncomment if using diagonal sprites
if(xDir == global.speed && yDir == global.speed) {
	sprite_index = SpriteRobotFront;
} else if(xDir == global.speed && yDir == -global.speed) {
	sprite_index = SpriteRobotBack;
} else if(xDir == -global.speed && yDir == global.speed) {
	sprite_index = SpriteRobotFront;
} else if(xDir == -global.speed && yDir == -global.speed) {
	sprite_index = SpriteRobotBack;
}
*/

move_and_collide(xDir, yDir, ObjectTerrain);

x = clamp(x, 0, room_width - sprite_width);
y = clamp(y, 0, room_height - sprite_height);

global.time += delta_time;
if(global.time > 10000000) {
	global.time -= 10000000;
	global.health -= 1;
}

if (global.health <= 0) {
	global.wood_in_inventory = 0;
	room_restart();
}
