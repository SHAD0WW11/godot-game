extends Node2D
func _physics_process(delta):
    look_at(get_global_mouse_position())
    rotation_degrees -= 90
    rotation += deg_to_rad(90)

