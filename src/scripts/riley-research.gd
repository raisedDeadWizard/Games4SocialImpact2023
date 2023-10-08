extends Node2D

var bookNode = preload("res://src/scenes/book.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var book_instance = bookNode.instantiate()
	book_instance.set_meta("Page1", "Vegetable Grafting originated in 500 CE in China and was developed further overtime until the 50s when grafting and research went into full swing in Japan.")
	book_instance.set_meta("Page2", "Grafting is mixing the root systems of two of the same or different plants in an attempt to increase plant size and disease and pest management. ")
	self.add_child(book_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
