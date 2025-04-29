radius += expansion_speed;

if (radius >= max_radius) {
    instance_destroy();
}


if (distance_to_object(ObjectRobot) < radius + 4 && distance_to_object(ObjectRobot) > radius - 4) {
    global.takeDamage(1);
//	global.health -= 1;
}