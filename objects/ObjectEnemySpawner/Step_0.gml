if (!spawn_done) {
    if (instance_exists(ObjectSafe)) {
        safe_x = ObjectSafe.x;
        safe_y = ObjectSafe.y;
    }

    while (region < 4) {
        count = 0;
        region++;

        while (count < enemies_per_region) {
            valid_spawn = false;

            while (!valid_spawn) {
                switch (region) {
                    case 1: // t l
                        enemy1_x = irandom_range(left_limit, 10000);
                        enemy1_y = irandom_range(top_limit, 10000);
                    break;
                    case 2: // t r
                        enemy1_x = irandom_range(10000, right_limit);
                        enemy1_y = irandom_range(top_limit, 10000);
                    break;
                    case 3: // b l
                        enemy1_x = irandom_range(left_limit, 10000);
                        enemy1_y = irandom_range(10000, bottom_limit);
                    break;
                    case 4: // b r
                        enemy1_x = irandom_range(10000, right_limit);
                        enemy1_y = irandom_range(10000, bottom_limit);
                    break;
                }

                if (point_distance(enemy1_x, enemy1_y, safe_x, safe_y) > safe_distance) {
                    valid_spawn = true;
                    instance_create_layer(enemy1_x, enemy1_y, "Instances", ObjectEnemy1);
                    count++;
                }
            }
        }

        
        // enemy 2 spawner
        for (var i = 0; i < num_clusters; i++) {
            cluster_valid = false;

            while (!cluster_valid) {
                switch (region) {
                    case 1:
                        cluster_x = irandom_range(left_limit, 10000);
                        cluster_y = irandom_range(top_limit, 10000);
                        break;
                    case 2:
                        cluster_x = irandom_range(10000, right_limit);
                        cluster_y = irandom_range(top_limit, 10000);
                        break;
                    case 3:
                        cluster_x = irandom_range(left_limit, 10000);
                        cluster_y = irandom_range(10000, bottom_limit);
                        break;
                    case 4:
                        cluster_x = irandom_range(10000, right_limit);
                        cluster_y = irandom_range(10000, bottom_limit);
                        break;
                }

                if (point_distance(cluster_x, cluster_y, safe_x, safe_y) > safe_distance) {
                    cluster_valid = true;
                    enemies_per_cluster = irandom_range(7, 12);

                    for (var j = 0; j < enemies_per_cluster; j++) {
                        spawn_valid = false;
                        tries = 0;

                        while (!spawn_valid && tries < max_tries) {
                            tries++;
                            enemy2_x = cluster_x + irandom_range(-400, 400);
                            enemy2_y = cluster_y + irandom_range(-400, 400);

                            if (instance_position(enemy2_x, enemy2_y, ObjectEnemy2) == noone) {
                                spawn_valid = true;
                                instance_create_layer(enemy2_x, enemy2_y, "Instances", ObjectEnemy2);
                            }
                        }
                    }
                }
            }
        }
    }

    spawn_done = true;
}
