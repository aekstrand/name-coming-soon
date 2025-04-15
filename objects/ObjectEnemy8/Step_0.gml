if (wander_pause_timer > 0) {
    spd = 0;
    wander_pause_timer--;
} else {
    spd = 5.2;
    wander_timer--;

    move_x = lengthdir_x(spd, wander_dir);
    move_y = lengthdir_y(spd, wander_dir);

    if (point_distance(xstart, ystart, x + move_x, y + move_y) < wander_range) {
        x += move_x;
        y += move_y;
    } else {
        wander_timer = 0;
    }

    if (wander_timer <= 0) {
        wander_dir = irandom(359);
        wander_timer = irandom_range(60, 120);
        wander_pause_timer = 60;
    }
}


if (place_meeting(x, y, ObjectRobot) && !attacking) {
    global.health -= 1;
    attacking = true;
    alarm[0] = 80;
}