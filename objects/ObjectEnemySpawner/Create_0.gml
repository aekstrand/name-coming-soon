randomize();

safe_x = 0;
safe_y = 0;
safe_distance = 1200;

if (instance_exists(ObjectSafe)) {
    safe_x = ObjectSafe.x;
    safe_y = ObjectSafe.y;
}

spawn_center_x = 10016;
spawn_center_y = 10016;

spawn_done = false;

spawn_radius_min = 1200;
spawn_radius_max = 20000;

REGION_NORTH = 0;
REGION_EAST = 1;
REGION_SOUTH = 2;
REGION_WEST = 3;


enemy_spawn_data = [
    [ObjectEnemy1, 30],
    [ObjectEnemy2, 40],
    [ObjectEnemy3, 30],
    [ObjectEnemy4, 16],
    [ObjectEnemy5, 40],
    [ObjectEnemy6, 40],
    [ObjectEnemy7, 40],
    [ObjectEnemy8, 40]
];