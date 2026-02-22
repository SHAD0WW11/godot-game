extends Control
#remake this somepoint lol
var current_max_fps = Engine.max_fps

func _ready():
		#fps cap label
		$"fps cap/Label".text = "fps cap " + str(current_max_fps)
		if $"fps cap/Label".text == "fps cap 0":
			$"fps cap/Label".text = "fps cap 60"
		$"fps cap".value = current_max_fps
		#windowed/fullscreen mode show
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			#fullscreen
			$fullscreen.button_pressed = true
		else:
			#windowed
			$fullscreen.button_pressed = false
		
func _process(delta: float) -> void:
	$"fps cap/monitor fps".text = "monitor refresh rate: " + str(round(DisplayServer.screen_get_refresh_rate()))

#go back to menu
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
#toggles windowed or fullscreen
func _on_check_button_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
#fps cap
func _on_fps_cap_value_changed(value: int) -> void:
	Engine.max_fps = value
	$"fps cap/Label".text = "fps cap " + str(value)

#vsync
func _on_vsync_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
