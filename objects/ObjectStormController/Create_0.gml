function shifted_random_range(minVal, maxVal) {
	return (1-power(random(1), 3)) * (maxVal - minVal) + minVal;
}

function spawn_item(biome, rare, objId, list) {
	maxR = 10000;
	minR = 0;
	if(rare) {
		minR = 5000;
	} else {
		minR = 500;
	}
	show_debug_message(minR);
	minA = 0;
	maxA = 0;
	if(biome == 0) {
		minA = 225;
		maxA = 315;
	} else if(biome == 1) {
		minA = 135;
		maxA = 225;
	} else if(biome == 2) {
		minA = 45;
		maxA = 135;
	} else {
		minA = -45;
		maxA = 45;
	}
	finalR = shifted_random_range(minR, maxR);
	finalA = random_range(minA, maxA)*pi/180;
	array_push(list, instance_create_layer(finalR*cos(finalA) + room_width/2, finalR*sin(finalA) + room_height/2, "Instances", objId));
}

function spawn_desert() {
	for(var i = 0; i < 100; i++) {
		spawn_item(0, false, ObjectQuartz, global.desert_items);
		spawn_item(0, false, ObjectWood, global.desert_items);
		spawn_item(0, false, ObjectOil, global.desert_items);
		if(i%2==0) spawn_item(0, true, ObjectGold, global.desert_items);
		if(i%10==0) spawn_item(0, false, ObjectBattery, global.desert_items);
	}
}

function spawn_marsh() {
	for(var i = 0; i < 100; i++) {
		spawn_item(1, false, ObjectCopper, global.marsh_items);
		spawn_item(1, false, ObjectWood, global.marsh_items);
		spawn_item(1, false, ObjectClay, global.marsh_items);
		if(i%2==0) spawn_item(1, true, ObjectUranium, global.marsh_items);
		if(i%10==0) spawn_item(1, false, ObjectBattery, global.marsh_items);
	}
}

function spawn_peaks() {
	for(var i = 0; i < 100; i++) {
		spawn_item(2, false, ObjectCopper, global.peaks_items);
		spawn_item(2, false, ObjectSulphur, global.peaks_items);
		spawn_item(2, false, ObjectBauxite, global.peaks_items);
		if(i%2==0) spawn_item(2, true, ObjectPlatinum, global.peaks_items);
		if(i%10==0) spawn_item(2, false, ObjectBattery, global.peaks_items);
	}
}

function spawn_volcano() {
	for(var i = 0; i < 100; i++) {
		spawn_item(3, false, ObjectQuartz, global.volcano_items);
		spawn_item(3, false, ObjectSulphur, global.volcano_items);
		spawn_item(3, false, ObjectLithium, global.volcano_items);
		if(i%2==0) spawn_item(3, true, ObjectDiamond, global.volcano_items);
		if(i%10==0) spawn_item(3, false, ObjectBattery, global.volcano_items);
	}
}

function clear_biome(biome_list) {
	for(var i = 0; i < 360; i++) {
		instance_destroy(array_pop(biome_list));
	}
}

global.storm_location = 0;
global.storm_timer = 0;
global.desert_items = array_create(360);
global.marsh_items = array_create(360);
global.peaks_items = array_create(360);
global.volcano_items = array_create(360);
spawn_desert();
spawn_marsh();
spawn_peaks();
spawn_volcano();