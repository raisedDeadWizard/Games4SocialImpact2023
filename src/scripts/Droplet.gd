extends CharacterBody2D


var speed = 400

func _physics_process(delta):
	if speed:
		velocity.y = 1 * speed
		move_and_slide()
