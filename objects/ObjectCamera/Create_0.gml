#macro RES_W 1920
#macro RES_H 1080

x = ObjectRobot.x
y = ObjectRobot.y

cam_width = RES_W;
cam_height = RES_H;

follow = ObjectRobot;

x_to = x;
y_to = y;

cam_min_x = (cam_width*0.5)
cam_max_x = room_width - (cam_width*0.5)

cam_min_y = (cam_height*0.5)
cam_max_y = room_height - (cam_height*0.5)

vp_left = 0;
vp_right = 0;
vp_top = 0;
vp_bottom = 0;

