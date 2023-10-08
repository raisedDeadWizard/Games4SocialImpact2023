extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	
	Global.scene_index += 1
	if Global.scene_index == 4:
		Global.max_drops = 25
	print("index: ",Global.scene_index)
	get_tree().change_scene_to_file(Global.scene_array[Global.scene_index])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
