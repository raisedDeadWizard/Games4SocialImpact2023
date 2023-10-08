extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var health = get_meta("Health")
	if health == 1:
		$Wilting.hide()
	if health == 0:
		$Healthy.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
