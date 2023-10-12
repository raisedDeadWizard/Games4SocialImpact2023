extends Node2D

var bookNode = preload("res://src/scenes/book.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var book_instance = bookNode.instantiate()
	book_instance.set_meta("Page1", "The Tree of Life is fueled by the growth of the environment around it, as decay and death approaches, the Tree suffers as a result. But, as the village expands and grows so does the Tree of Life.")
	book_instance.set_meta("Page2", "You will need to improve the lives of crucial villagers in order to keep the tree alive and make necessary changes in the history of the village. ")
	self.add_child(book_instance)

	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
		# move to next nod
