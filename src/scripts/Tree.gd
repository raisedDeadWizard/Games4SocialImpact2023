extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	_updateHealth()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _updateHealth():
	var health = Global.tree_health
	if health == 3:
		get_tree().change_scene_to_file("res://src/scenes/GameOver.tscn")
	$Wilting.hide()
	$Healthy.hide()
	$Dying.hide()
	match health:
		0:
			$Healthy.show()
		1:
			$Wilting.show()
		2:
			$Dying.show()
