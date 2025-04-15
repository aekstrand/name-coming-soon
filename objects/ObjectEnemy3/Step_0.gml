dist_to_spawn = point_distance(ObjectRobot.x, ObjectRobot.y, xstart, ystart);

switch (state) {
    case "idle":
        image_alpha = 0;
        if (dist_to_spawn < aggro_range) {
            state = "appear";
        }
    break;

    case "appear":
        if (dist_to_spawn >= aggro_range) {
            state = "idle";
            break;
        }

        x = ObjectRobot.x;
        y = ObjectRobot.y;
        fading_in = true;
        image_alpha = 0;
        state = "fading";
    break;

    case "fading":
        if (dist_to_spawn >= aggro_range) {
            state = "idle";
            break;
        }

        image_alpha += fade_speed;
        if (image_alpha >= 1) {
            image_alpha = 1;
            fading_in = false;
            state = "check_damage";
        }
    break;

    case "check_damage":
        if (place_meeting(x, y, ObjectRobot)) {
            global.health -= 1;
        }

        image_alpha = 0;
        alarm[0] = room_speed * 1;
        state = "cooldown";
    break;

    case "cooldown":
    break;
}