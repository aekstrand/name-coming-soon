state = "idle";
attacking = false;

aggro_range = 770;
stop_chase_dist = 860;
attack_range = 6;
xstart = x;
ystart = y;

dir = 0;
move_x = 0;
move_y = 0;


segments = [];
segment_distance = 24;
path_x = [];
path_y = [];

for (var i = 0; i < 12; i++) {
    var segment = instance_create_layer(x, y, "Instances", ObjectEnemy4_1);
    segments[i] = segment;
}

// fill history
for (var i = 0; i <= array_length(segments) * segment_distance; i++) {
    array_push(path_x, x);
    array_push(path_y, y);
}

dist_to_player = 0
max_history = 0

dash_target_x = 0;
dash_target_y = 0;
dash_timer = 0;
dash_duration = 300;

spd = 0

