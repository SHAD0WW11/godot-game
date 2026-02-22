extends CharacterBody2D
var speed: float = 1
var speed_multi = 250

func get_input():
	var input_dir = Input.get_vector("left","right","up","down")
	velocity = input_dir * speed * speed_multi

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)