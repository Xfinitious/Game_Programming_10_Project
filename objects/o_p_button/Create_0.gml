#macro MOUSEGUI_X device_mouse_x_to_gui(0)
#macro MOUSEGUI_Y device_mouse_y_to_gui(0)

image_speed = 0;

enum buttonState {
	active,
	inactive,
}
btnState = buttonState.active;