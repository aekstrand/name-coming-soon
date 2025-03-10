var xDir = 0;
var yDir = 0;

if(keyboard_check(ord("A"))) {
	xDir = -global.speed;
} else if(keyboard_check(ord("D"))) {
	xDir = global.speed;
}
if(keyboard_check(ord("W"))) {
	yDir = -global.speed;
} else if(keyboard_check(ord("S"))) {
	yDir = global.speed;
}

move_and_collide(xDir, yDir, all);