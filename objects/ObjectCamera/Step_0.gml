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

vp_left = x-(cam_width*0.5);
vp_right = x+(cam_width*0.5);
vp_top = y-(cam_height*0.5);
vp_bottom = y+(cam_height*0.5);

camera_set_view_pos(view_camera[0], vp_left, vp_top)