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

move_and_collide(xDir, yDir, all);