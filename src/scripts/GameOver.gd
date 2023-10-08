extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			Global.scene_index = -1
			Global.tree_health = 0
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
