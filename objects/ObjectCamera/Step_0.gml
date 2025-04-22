if (instance_exists(follow)) {
	if (follow != noone)
	{
		x_to = follow.x;
		y_to = follow.y;
	}

	x += (x_to - x)/25
	y += (y_to - y)/25

	x = clamp(x, cam_min_x, cam_max_x)
	y = clamp(y, cam_min_y, cam_max_y)
}

// Step Event
if (!global.can_walk) {
	current_zoom -= zoom_speed / 2 * (delta_time / 20000);
	if (current_zoom > 0.5) {
		current_zoom -= zoom_speed / 2 * (delta_time / 20000);
	}
	if (current_zoom < 0.2) current_zoom = 0.2;
} else if (current_zoom < 4) {
	current_zoom += zoom_speed * (delta_time / 20000);
	if (current_zoom > 4) current_zoom = 4;
}

// Clamp so it doesn’t overshoot
//if (current_zoom < global.target_zoom) current_zoom = global.target_zoom;

var w = display_get_width() * current_zoom;
var h = display_get_height() * current_zoom;

var cx = camera_get_view_x(cam) + camera_get_view_width(cam)/2;
var cy = camera_get_view_y(cam) + camera_get_view_height(cam)/2;

camera_set_view_size(cam, w, h);
//camera_set_view_pos(cam, cx - w/2, cy - h/2);

vp_left = x-(cam_width*0.5*current_zoom);
vp_right = x+(cam_width*0.5);
vp_top = y-(cam_height*0.5*current_zoom);
vp_bottom = y+(cam_height*0.5);

camera_set_view_pos(cam, vp_left, vp_top)