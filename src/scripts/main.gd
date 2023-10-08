extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	
	Global.scene_index += 1
	match Global.scene_index:
		0:
			print("UPDATED GLOBALS")
			Global.max_drops = 25
			Global.water_timer = 31
			Global.weed_timer = 35
			Global.book_timer = 15
		13:
			print("UPDATED GLOBALS")
			Global.max_drops = 30
			Global.water_timer = 41
			Global.weed_timer = 25
			Global.book_timer = 10
		26:
			print("UPDATED GLOBALS")
			Global.max_drops = 35
			Global.water_timer = 46
			Global.weed_timer = 20
			Global.book_timer = 7
		
	if Global.scene_index == 42:
		Global.scene_index = -1
		get_tree().change_scene_to_file("res://src/scenes/main.tscn")
	get_tree().change_scene_to_file(Global.scene_array[Global.scene_index])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
