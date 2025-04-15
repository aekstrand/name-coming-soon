if (!spawn_done) {
    if (instance_exists(ObjectSafe)) {
        safe_x = ObjectSafe.x;
        safe_y = ObjectSafe.y;
    }

    for (var i = 0; i < array_length(enemy_spawn_data); i++) {
        var enemy_obj = enemy_spawn_data[i][0];
        var count = enemy_spawn_data[i][1];

        var region = i div 2;
if (enemy_obj == ObjectEnemy2) {

    var num_clusters = 15; 
    var max_tries = 30;
    var enemies_per_cluster = 11;

    for (var c = 0; c < num_clusters; c++) {
        var cluster_valid = false;
        var cluster_x, cluster_y;

        while (!cluster_valid) {
            var angle_deg;
            switch (region) {
                case REGION_NORTH:
                    angle_deg = irandom(1) == 0 ? irandom_range(315, 359) : irandom_range(0, 45);
                    break;
                case REGION_EAST:
                    angle_deg = irandom_range(45, 135);
                    break;
                case REGION_SOUTH:
                    angle_deg = irandom_range(135, 225);
                    break;
                case REGION_WEST:
                    angle_deg = irandom_range(225, 315);
                    break;
            }

            var dist = irandom_range(spawn_radius_min, spawn_radius_max);
            cluster_x = spawn_center_x + lengthdir_x(dist, angle_deg);
            cluster_y = spawn_center_y + lengthdir_y(dist, angle_deg);

            if (point_distance(cluster_x, cluster_y, safe_x, safe_y) > safe_distance) {
                cluster_valid = true;
            }
        }

        for (var j = 0; j < enemies_per_cluster; j++) {
            var tries = 0;
            var spawn_valid = false;

            while (!spawn_valid && tries < max_tries) {
                tries++;
                var ex = cluster_x + irandom_range(-300, 300);
                var ey = cluster_y + irandom_range(-300, 300);

                if (point_distance(ex, ey, safe_x, safe_y) > safe_distance &&
                    instance_position(ex, ey, enemy_obj) == noone) {
                    spawn_valid = true;
                    instance_create_layer(ex, ey, "Instances", enemy_obj);
                }
            }
        }
    }
    continue; 
}


        var spawned = 0;
        while (spawned < count) {
            var angle_deg;

            switch (region) {
case REGION_NORTH:
angle_deg = irandom(1) == 0 ? irandom_range(315, 359) : irandom_range(0, 45);
break;
case REGION_EAST:
angle_deg = irandom_range(45, 135);
break;
case REGION_SOUTH:
angle_deg = irandom_range(135, 225);
break;
case REGION_WEST:
angle_deg = irandom_range(225, 315);
break;
}

            var dist = irandom_range(spawn_radius_min, spawn_radius_max);
            var x_pos = spawn_center_x + lengthdir_x(dist, angle_deg);
            var y_pos = spawn_center_y + lengthdir_y(dist, angle_deg);

            if (point_distance(x_pos, y_pos, safe_x, safe_y) > safe_distance) {
                instance_create_layer(x_pos, y_pos, "Instances", enemy_obj);
                spawned++;
            }
        }
    }

    spawn_done = true;
}