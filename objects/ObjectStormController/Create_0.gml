//PARTICLE MANAGEMENT (as far as I can tell there is no way to reduce this ridiculous amount of code. I apologize)
global.ps = part_system_create();
global.emitterArray = [];

//StormPS
part_system_draw_order(global.ps, true);

//ElectricityEmitter
global.electricityParticleType = part_type_create();
part_type_sprite(global.electricityParticleType, GM_Electricity_spr_Electricity1, false, true, false)
part_type_size(global.electricityParticleType, 0.5, 1, 0, 0);
part_type_scale(global.electricityParticleType, 1, 1);
part_type_speed(global.electricityParticleType, 0, 0, 0, 0);
part_type_direction(global.electricityParticleType, 0, 360, 0, 0);
part_type_gravity(global.electricityParticleType, 0, 270);
part_type_orientation(global.electricityParticleType, 0, 360, 0.4, 1, false);
part_type_colour3(global.electricityParticleType, $1913EA, $FF6100, $FF0800);
part_type_alpha3(global.electricityParticleType, 1, 0.439, 0);
part_type_blend(global.electricityParticleType, true);
part_type_life(global.electricityParticleType, 150, 240);
global.vanishElectricityPulseParticleType = part_type_create();
part_type_shape(global.vanishElectricityPulseParticleType, pt_shape_cloud);
part_type_size(global.vanishElectricityPulseParticleType, 0, 0, 0.01, 0);
part_type_scale(global.vanishElectricityPulseParticleType, 1, 1);
part_type_speed(global.vanishElectricityPulseParticleType, 0, 0.1, 0.01, 0);
part_type_direction(global.vanishElectricityPulseParticleType, 0, 360, 0, 2);
part_type_gravity(global.vanishElectricityPulseParticleType, 0, 270);
part_type_orientation(global.vanishElectricityPulseParticleType, 0, 0, 0, 0, false);
part_type_colour3(global.vanishElectricityPulseParticleType, $FFFFC2, $FF00BF, $FFBB00);
part_type_alpha3(global.vanishElectricityPulseParticleType, 1, 1, 0);
part_type_blend(global.vanishElectricityPulseParticleType, true);
part_type_life(global.vanishElectricityPulseParticleType, 50, 80);
part_type_death(global.electricityParticleType, 25, global.vanishElectricityPulseParticleType);

//var electricityEmitter = part_emitter_create(global.ps);
//part_emitter_region(global.ps, electricityEmitter, -144.02808, 266.02808, 86.13092, 1277.8691, ps_shape_rectangle, ps_distr_linear);
//part_emitter_stream(global.ps, electricityEmitter, global.electricityParticleType, 2);
//part_emitter_interval(global.ps, electricityEmitter, 0.2, 0.5, time_source_units_seconds);

//StormEmitter
global.stormParticleType = part_type_create();
part_type_shape(global.stormParticleType, pt_shape_line);
part_type_size(global.stormParticleType, 0.25, 0.5, 0, 0);
part_type_scale(global.stormParticleType, 3, 0.5);
part_type_speed(global.stormParticleType, 10, 10, 0, 0);
part_type_direction(global.stormParticleType, 280, 290, 0, 4);
part_type_gravity(global.stormParticleType, 0.5, 270);
part_type_orientation(global.stormParticleType, 100, 100, 0, 0, false);
part_type_colour3(global.stormParticleType, $FFEE5E, $FFC300, $FFFFFF);
part_type_alpha3(global.stormParticleType, 1, 0.98, 0.031);
part_type_blend(global.stormParticleType, false);
part_type_life(global.stormParticleType, 5, 60);
global.splashParticleType = part_type_create();
part_type_shape(global.splashParticleType, pt_shape_disk);
part_type_size(global.splashParticleType, 0.1, 0.05, 0, 0);
part_type_scale(global.splashParticleType, 1, 1);
part_type_speed(global.splashParticleType, 1, 1, 0.01, 0);
part_type_direction(global.splashParticleType, 0, 360, 0, 0);
part_type_gravity(global.splashParticleType, 0, 270);
part_type_orientation(global.splashParticleType, 0, 0, 0, 0, false);
part_type_colour3(global.splashParticleType, $FFFFC2, $FFF600, $FFBB00);
part_type_alpha3(global.splashParticleType, 1, 1, 0);
part_type_blend(global.splashParticleType, false);
part_type_life(global.splashParticleType, 50, 80);
part_type_death(global.stormParticleType, 5, global.splashParticleType);

//var stormEmitter = part_emitter_create(global.ps);
//part_emitter_region(global.ps, stormEmitter, -2560, 2560, 0, 0, ps_shape_line, ps_distr_linear);
//part_emitter_stream(global.ps, stormEmitter, global.stormParticleType, 2);

//HazeEmitter
global.hazeParticleType = part_type_create();
part_type_shape(global.hazeParticleType, pt_shape_cloud);
part_type_size(global.hazeParticleType, 1.5, 2, 0, 0.1);
part_type_scale(global.hazeParticleType, 1, 1);
part_type_speed(global.hazeParticleType, 0.1, 0.3, 0, 0);
part_type_direction(global.hazeParticleType, 280, 290, 0, 0);
part_type_gravity(global.hazeParticleType, 0, 270);
part_type_orientation(global.hazeParticleType, 0, 360, 0, 0, false);
part_type_colour3(global.hazeParticleType, $FF4D07, $FFEE93, $E2FF0A);
part_type_alpha3(global.hazeParticleType, 1, 1, 0.259);
part_type_blend(global.hazeParticleType, true);
part_type_life(global.hazeParticleType, 700, 700);

//var hazeEmitter = part_emitter_create(global.ps);
//part_emitter_region(global.ps, hazeEmitter, -175.87305, 305.87305, 30.071045, 1205.929, ps_shape_rectangle, ps_distr_linear);
//part_emitter_stream(global.ps, hazeEmitter, global.hazeParticleType, 1);
//part_emitter_interval(global.ps, hazeEmitter, 8, 8, time_source_units_frames);

//part_system_position(global.ps, room_width/2, room_height/2);

function shifted_random_range(minVal, maxVal) {
	return (1-power(random(1), 3)) * (maxVal - minVal) + minVal;
}

function spawn_item(biome, rare, objId, list) {
	maxR = 10000;
	minR = 0;
	if(rare) {
		minR = 5000;
	} else {
		minR = 1000;
	}
//	show_debug_message(minR);
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
	for(var i = 0; i < 50; i++) {
		spawn_item(0, false, ObjectQuartz, global.desert_items);
		spawn_item(0, false, ObjectWood, global.desert_items);
		spawn_item(0, false, ObjectOil, global.desert_items);
		if(i%2==0) spawn_item(0, true, ObjectGold, global.desert_items);
		if(i%5==0) spawn_item(0, false, ObjectBattery, global.desert_items);
	}
}

function spawn_marsh() {
	for(var i = 0; i < 50; i++) {
		spawn_item(1, false, ObjectCopper, global.marsh_items);
		spawn_item(1, false, ObjectWood, global.marsh_items);
		spawn_item(1, false, ObjectClay, global.marsh_items);
		if(i%2==0) spawn_item(1, true, ObjectUranium, global.marsh_items);
		if(i%5==0) spawn_item(1, false, ObjectBattery, global.marsh_items);
	}
}

function spawn_peaks() {
	for(var i = 0; i < 50; i++) {
		spawn_item(2, false, ObjectCopper, global.peaks_items);
		spawn_item(2, false, ObjectSulphur, global.peaks_items);
		spawn_item(2, false, ObjectBauxite, global.peaks_items);
		if(i%2==0) spawn_item(2, true, ObjectPlatinum, global.peaks_items);
		if(i%5==0) spawn_item(2, false, ObjectBattery, global.peaks_items);
	}
}

function spawn_volcano() {
	for(var i = 0; i < 50; i++) {
		spawn_item(3, false, ObjectQuartz, global.volcano_items);
		spawn_item(3, false, ObjectSulphur, global.volcano_items);
		spawn_item(3, false, ObjectLithium, global.volcano_items);
		if(i%2==0) spawn_item(3, true, ObjectDiamond, global.volcano_items);
		if(i%5==0) spawn_item(3, false, ObjectBattery, global.volcano_items);
	}
}

function clear_biome(biome_list) {
	for(var i = 0; i < 185; i++) {
		instance_destroy(array_pop(biome_list));
	}
}


function move_storm_particles() {
	if (!is_array(global.emitterArray)) {
		global.emitterArray = [];
		show_debug_message("emitterArray reset");
	}
	
	array_foreach(global.emitterArray, function(value) {
		var position;
		position = random_point_in_biome(global.storm_location);
		value.x = position[0];
		value.y = position[1];
	});
}

global.storm_location = 0;
global.storm_timer = 0;
global.desert_items = array_create(185);
global.marsh_items = array_create(185);
global.peaks_items = array_create(185);
global.volcano_items = array_create(185);

//storm_sys = StormPS;
//storm_emitter = part_emitter_create(storm_sys);
//part_emitter_region(StormPS, StormPS.)
//part_system_depth(storm_particles_sys, -100);

spawn_desert();
spawn_marsh();
spawn_peaks();
spawn_volcano();

for (var i = 0; i < 0; i++) {
	for (var j = 0; j < 3; j++) {
		var position = random_point_in_biome(global.storm_location);
		var newEmitter = create_particle_by_id(j, position[0], position[1]);
		show_debug_message("array length: " + string(array_length(global.emitterArray)));
		array_push(global.emitterArray, newEmitter);
	}
}
show_debug_message("array length2: " + string(array_length(global.emitterArray)));

//do not use without saving emitter to array
function create_particle_by_id(id, x, y) {
	if (id == 0) { //ElectricityEmitterS
		return create_particle(global.electricityParticleType, x, y, 400, 400, 2, ps_shape_rectangle, ps_distr_linear, 0.2, 0.5, time_source_units_seconds);
	} else if (id == 1) { //StormEmitter
		return create_particle(global.stormParticleType, x, y, 400, 0, 2, ps_shape_line, ps_distr_linear, -1, -1, time_source_units_frames);
	} else if (id == 2) { //HazeEmitter
		return create_particle(global.hazeParticleType, x, y, 500, 500, 1, ps_shape_rectangle, ps_distr_linear, 8, 8, time_source_units_frames);
	}
}
show_debug_message("array length3: " + string(array_length(global.emitterArray)));


//do not use without saving emitter to array
function create_particle(particleType, xPos, yPos, xSize, ySize, particlesPerStep, shape, distribution, intervalMin, intervalMax, timeUnit) {
	var emitter = part_emitter_create(global.ps);
//	part_emitter_region(global.ps, emitter, -xSize/2, xSize/2, -ySize/2, ySize/2, shape, distribution);
	part_emitter_region(global.ps, emitter, xPos, xPos + xSize, yPos, yPos + ySize, shape, distribution);
	part_emitter_stream(global.ps, emitter, particleType, 0);
	part_emitter_stream(global.ps, emitter, particleType, particlesPerStep);
	if (intervalMin != -1 && intervalMax != -1) {
		part_emitter_interval(global.ps, emitter, intervalMin, intervalMax, timeUnit);
	}
	return {
        id: emitter,
        x: xPos,
        y: yPos,
		particlesPerStep: particlesPerStep,
        type: particleType,
        active: true
	}
}

show_debug_message("array length4: " + string(array_length(global.emitterArray)));


function random_point_in_biome(biome) {
	maxR = 10000;
	minR = 0;
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
	
	return[finalR*cos(finalA) + room_width/2, finalR*sin(finalA) + room_height/2];
}

