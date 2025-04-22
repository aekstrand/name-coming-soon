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