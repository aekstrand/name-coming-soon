if (shooting && state == "attack") {
    instance_create_layer(x, y, "Instances", ObjectProjectile);
    
    shooting = false;

    if (distance_to_object(ObjectRobot) < attack_range) {
        alarm[0] = 70; 
    } else if (distance_to_object(ObjectRobot) > attack_range && shooting == false) {
            state = "chasing";
    }
}