extends Node2D

var bookNode = preload("res://src/scenes/book.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var book_instance = bookNode.instantiate()
	book_instance.set_meta("Page1", "You are an immortal aspect of nature itself, and as you gain knowledge and help villagers you are able to fulfill your duty")
	book_instance.set_meta("Page2", "and continue improving the lives of others, however if you fail the village and fail to protect the tree you lose your immortality. ")
	self.add_child(book_instance)

	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
