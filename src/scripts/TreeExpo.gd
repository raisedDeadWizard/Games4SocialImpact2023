extends Node2D

var bookNode = preload("res://src/scenes/book.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var book_instance = bookNode.instantiate()
	book_instance.set_meta("Page1", "Tree Expo")
	book_instance.set_meta("Page2", "Page 2!")
	book_instance.set_meta("Page3", "Page 3!")
	book_instance.set_meta("Page4", "Page 4!")
	self.add_child(book_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		print(event)
		if event.is_pressed():
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
		# move to next nod
