switch (state) {
    case "idle":
        if (distance_to_object(ObjectRobot) < aggro_range) {
            state = "chasing";
        }
    break;

    case "chasing":
        if (place_meeting(ObjectRobot.x, ObjectRobot.y, ObjectSafe)) {
            state = "return";
            break;
        }

        spd = 7;
        dir = point_direction(x, y, ObjectRobot.x, ObjectRobot.y);
        move_x = lengthdir_x(spd, dir);
        move_y = lengthdir_y(spd, dir);

        if (!place_meeting(x + move_x, y + move_y, ObjectEnemy1)) {
            x += move_x;
            y += move_y;
        } else {
            if (!place_meeting(x + move_x, y, ObjectEnemy1)) x += move_x;
            else if (!place_meeting(x, y + move_y, ObjectEnemy1)) y += move_y;
        }

        if (distance_to_object(ObjectRobot) < attack_range) {
            state = "attack";
        } else if (distance_to_object(ObjectRobot) > aggro_range) {
            state = "return";
        }

        if (distance_to_object(ObjectRobot) > stop_chase_dist) {
            state = "return";
        }
    break;

    case "attack":
        if (place_meeting(ObjectRobot.x, ObjectRobot.y, ObjectSafe)) {
            state = "return";
            break;
        }

        spd = 0;
        if (!shooting) {
            shooting = true;
            alarm[0] = 70;
        }

        if (distance_to_object(ObjectRobot) > attack_range && !shooting) {
            state = "chasing";
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
