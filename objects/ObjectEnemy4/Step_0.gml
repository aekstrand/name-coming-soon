dist_to_player = distance_to_object(ObjectRobot);

switch (state) {
    case "idle":
        if (dist_to_player < aggro_range) {
            state = "chasing";
        }
    break;

    case "chasing":
    if (place_meeting(ObjectRobot.x, ObjectRobot.y, ObjectSafe)) {
        state = "return";
        break;
    }
	if (distance_to_object(ObjectRobot) > stop_chase_dist) {
            state = "return";
    }
    if (state != "dash") {
        state = "dash";
        dash_target_x = ObjectRobot.x;
        dash_target_y = ObjectRobot.y;
        dash_timer = dash_duration;
    }
    break;


    case "attack":
        spd = 0;
        if (!attacking) {
            attacking = true;
			global.takeDamage(1);
            //global.health -= 1;
            alarm[0] = 60;
        }

        if (dist_to_player > attack_range) {
            state = "chasing";
            attacking = false;
        }
    break;
	
	case "dash":
		if (place_meeting(ObjectRobot.x, ObjectRobot.y, ObjectSafe)) {
			state = "return";
			break;
		}
		spd = 4.5;

		var dash_dir = point_direction(x, y, dash_target_x, dash_target_y);
		move_x = lengthdir_x(spd, dash_dir);
		move_y = lengthdir_y(spd, dash_dir);

		x += move_x;
		y += move_y;

		dash_timer--;
		if (dash_timer <= 0) {
			state = "chasing";
		}

		if (distance_to_object(ObjectRobot) < attack_range) {
			state = "attack";
		}
		if (distance_to_object(ObjectRobot) > stop_chase_dist) {
            state = "return";
        }
	break;

    case "return":
        dir = point_direction(x, y, xstart, ystart);
        move_x = lengthdir_x(spd, dir);
        move_y = lengthdir_y(spd, dir);

        if (distance_to_point(xstart, ystart) > 4) {
            x += move_x;
            y += move_y;
        } else {
            spd = 0;
            x = xstart;
            y = ystart;
            state = "idle";
        }
    break;
}


array_insert(path_x, 0, x);
array_insert(path_y, 0, y);

max_history = array_length(segments) * segment_distance;
if (array_length(path_x) > max_history) {
    array_pop(path_x);
    array_pop(path_y);
}

for (var i = 0; i < array_length(segments); i++) {
    var index = (i + 1) * segment_distance;
    if (index < array_length(path_x)) {
        segments[i].x = path_x[index];
        segments[i].y = path_y[index];
    }
}