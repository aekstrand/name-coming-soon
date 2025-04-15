//enemy that just chases the player but gets a burst of speed every couple secs


state = "idle"
attacking = false

spd = 6
aggro_range = 600
stop_chase_dist = 750
attack_range = 6
xstart = x
ystart = y

dir = 0
move_x = 0
move_y = 0

shooting = false;

//fast
speed_active = false;
speed_timer = irandom_range(240, 600);
speed_duration = 0;