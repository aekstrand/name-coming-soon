randomize();

safe_x = 0;
safe_y = 0;
safe_distance = 400;
count = 0;
valid_spawn = false;

if (instance_exists(ObjectSafe)) {
    safe_x = ObjectSafe.x;
    safe_y = ObjectSafe.y;
}

enemies_per_region = 40;

left_limit = 10000 - room_width / 2;
right_limit = 10000 + room_width / 2;
top_limit = 10000 - room_height / 2;
bottom_limit = 10000 + room_height / 2;

spawn_done = false;
region = 0;

x_spawn = 0;
y_spawn = 0;

enemy1_x = 0;
enemy1_y = 0;

// enemy 2 spawner attributes
num_clusters = 8;

cluster_x = 0;
cluster_y = 0;

spawn_valid = false;
enemy2_x = 0;
enemy2_y = 0;

cluster_valid = false;
enemies_per_cluster = 0;
tries = 0;
max_tries = 30;