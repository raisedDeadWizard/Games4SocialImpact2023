extends Node2D

var bookNode = preload("res://src/scenes/book.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var book_instance = bookNode.instantiate()
	book_instance.set_meta("Page1", "The first kinds of greenhouses appeared in Roman times but were extremely rudimentary, but became much more common and widespread leading into the 18th century.")
	book_instance.set_meta("Page2", "Greenhouses are controlled indoor growing environments to help grow crops out of season or longer to the beginning and end of their given growing seasons. ")
	self.add_child(book_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
