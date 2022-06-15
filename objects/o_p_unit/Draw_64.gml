var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var xx = (x-cx)*Display_ScaleX;
var yy = (y-cy)*Display_ScaleY;

var _hp = current[@ HEALTH]/base[@ HEALTH];

draw_sprite(s_ui_HP,0,xx,yy-10);
draw_sprite_part(s_ui_HP,1,0,0,hpBarWidth*_hp,hpBarHeight,xx,yy-10);

var _sp = current[@ SKILLPOINTS]/base[@ SKILLPOINTS];
draw_sprite(s_ui_SP,0,xx+65,yy-10);
draw_sprite_part(s_ui_SP,1,0,0,hpBarWidth*_sp,hpBarHeight,xx+65,yy-10);