var xDir = 0;
var yDir = 0;

if(global.recipes_completed[0][0]) {
	if(global.emergency_boost) {
		global.speed = 10;
	} else {
		global.speed = 6;
	}
} else {
	if(global.emergency_boost) {
		global.speed = 8;
	} else {
		global.speed = 4;
	}
}

if(global.recipes_completed[0][4]) {
	global.max_inventory = 10;
} else {
	global.max_inventory = 6;
}

global.timeSinceDrivingSound += delta_time;

if (global.can_walk) {
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
	if(xDir != 0 && yDir != 0) {
		xDir /= sqrt(2);
		yDir /= sqrt(2);
	}
	
	if (xDir != 0 || yDir != 0) {
		show_debug_message(global.timeSinceDrivingSound > 100000000);	
		if (global.timeSinceDrivingSound > 1000000) {
			global.timeSinceDrivingSound = 0;
			audio_play_sound(sndRobotDriving, 0, false);
		}
	}
	//show_debug_message("player pos: " + string(x) + ", " + string(y));
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
if(global.time > 100000) {
	global.time -= 100000;
	if(global.recipes_completed[0][3]) {
		global.health -= 0.006;
	} else {
		global.health -= 0.01;
	}
}

if (global.health <= 0) {
	audio_play_sound(sndDeath, 0, false);
	global.wood_in_inventory = 0;
	room_restart();
}
