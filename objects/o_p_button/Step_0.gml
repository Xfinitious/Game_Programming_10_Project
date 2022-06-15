if (btnState == buttonState.active) {
	if (MainFunc!=noone && position_meeting(MOUSEGUI_X,MOUSEGUI_Y,id)) {
		image_index = 1;
		if (HoverFunc != noone) {
			script_execute(HoverFunc);
		}
		if (mouse_check_button(mb_left)) {
			image_index = 2;
		}
		if (o_Manager.allowInput && mouse_check_button_released(mb_left)) {
			script_execute(MainFunc);
		}
	}
	else
		image_index = 0;
}
//finished checking for bugs