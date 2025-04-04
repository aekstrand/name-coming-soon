function shifted_random_range(minVal, maxVal) {
	return (1-power(random(1), 3)) * (maxVal - minVal) + minVal;
}

function spawn_item(biome, rare, objId) {
	maxR = 10000;
	minR = 0;
	if(rare) {
		minR = 5000;
	} else {
		minR = 320;
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
	instance_create_layer(finalR*cos(finalA) + room_width/2, finalR*sin(finalA) + room_height/2, "Instances", objId);
}

function spawn_desert() {
	for(var i = 0; i < 200; i++) {
		spawn_item(0, false, ObjectQuartz);
		spawn_item(0, false, ObjectWood);
		spawn_item(0, false, ObjectOil);
		if(i%2==0) spawn_item(0, true, ObjectGold);
		if(i%10==0) spawn_item(0, false, ObjectBattery);
	}
}

function spawn_marsh() {
	for(var i = 0; i < 200; i++) {
		spawn_item(1, false, ObjectCopper);
		spawn_item(1, false, ObjectWood);
		spawn_item(1, false, ObjectClay);
		if(i%2==0) spawn_item(1, true, ObjectUranium);
		if(i%10==0) spawn_item(1, false, ObjectBattery);
	}
}

function spawn_peaks() {
	for(var i = 0; i < 200; i++) {
		spawn_item(2, false, ObjectCopper);
		spawn_item(2, false, ObjectSulphur);
		spawn_item(2, false, ObjectBauxite);
		if(i%2==0) spawn_item(2, true, ObjectPlatinum);
		if(i%10==0) spawn_item(2, false, ObjectBattery);
	}
}

function spawn_volcano() {
	for(var i = 0; i < 200; i++) {
		spawn_item(3, false, ObjectQuartz);
		spawn_item(3, false, ObjectSulphur);
		spawn_item(3, false, ObjectLithium);
		if(i%2==0) spawn_item(3, true, ObjectDiamond);
		if(i%10==0) spawn_item(3, false, ObjectBattery);
	}
}

global.storm_location = 0;
global.storm_timer = 0;
spawn_desert();
spawn_marsh();
spawn_peaks();
spawn_volcano();