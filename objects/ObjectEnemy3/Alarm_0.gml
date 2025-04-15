dist_to_spawn = point_distance(ObjectRobot.x, ObjectRobot.y, xstart, ystart);

if (dist_to_spawn < aggro_range) {
    state = "appear";
} else {
    state = "idle";
}