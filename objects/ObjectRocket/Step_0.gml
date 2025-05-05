var count = 0;
for(var i = 0; i < 5; i++) {
	if(global.recipes_completed[1][i]) {
		count += 1;
	}
}

if(count == 0 || count == 1) {
	sprite_index = house1;
} else if(count == 2) {
	sprite_index = house2;
} else if(count == 3) {
	sprite_index = house3;
} else if(count == 4) {
	sprite_index = house4;
} else if(count == 5) {
	sprite_index = house5;
}