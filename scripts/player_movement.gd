extends CharacterBody2D
var speed: float = 1
var speed_multi = 250
var sprinting = 1

func get_input():
	var input_dir = Input.get_vector("left","right","up","down")
	velocity = input_dir * speed * speed_multi * sprinting

func _physics_process(delta):
	get_input()
	sprint()
	move_and_collide(velocity * delta)

func sprint():
	if Input.is_action_pressed("sprint"):
		sprinting = 2
	else:
		sprinting = 1
