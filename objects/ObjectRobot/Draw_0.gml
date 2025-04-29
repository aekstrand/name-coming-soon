//if(global.health == 1) {
//	draw_sprite(SpriteQuarterCharge, 0, x, y-50);
//} else if(global.health == 2) {
//	draw_sprite(SpriteHalfCharge, 0, x, y-50);
//} else if(global.health == 3) {
//	draw_sprite(SpriteThreeQuarterCharge, 0, x, y-50);
//} else {
//	draw_sprite(SpriteFullCharge, 0, x, y-50);
//}

draw_healthbar(x - 64, y - 66, x + 64, y - 34, global.health / global.maxHealth * 100, c_ltgray, c_red, 0x00FF00, 0, true, true);

draw_set_font(Font1);
draw_set_color(make_color_rgb(0, 0, 0));
draw_text(x - 30, y - 58, "Battery: " + string(global.health));
draw_set_color(make_color_rgb(255, 255, 255));
draw_self()
