xstart = x;
ystart = y;

wander_range = 500;
wander_timer = irandom_range(80, 140);
wander_pause_timer = 0;
wander_dir = irandom(359);

spd = 0;
attacking = false;

sprite_index = SpriteEnemy8;