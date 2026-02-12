extends Control

func _ready():
		$"fps cap/Label".text = "fps cap 60"

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_check_button_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_fps_cap_value_changed(value: int) -> void:
	Engine.max_fps = value
	$"fps cap/Label".text = "fps cap " + str(value)
