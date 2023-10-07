extends CharacterBody2D


const SPEED = 300

func _physics_process(delta):
	velocity.y = 1 * SPEED
	move_and_slide()
