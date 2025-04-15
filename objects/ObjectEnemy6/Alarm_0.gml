if (shooting && state == "attack") {
    instance_create_layer(x, y, "Instances", ObjectSlam);

    shooting = false;

    if (distance_to_object(ObjectRobot) < attack_range) {
        alarm[0] = 110; 
    } else if (distance_to_object(ObjectRobot) > attack_range && shooting == false) {
            state = "chasing";
    }
}