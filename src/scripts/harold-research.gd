extends Node2D

var bookNode = preload("res://src/scenes/book.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var book_instance = bookNode.instantiate()
	book_instance.set_meta("Page1", "Tilling began in Ancient Egypt, but wasn’t done extensively, as compared to the amount of tilling that appeared later during Roman and Medieval times.")
	book_instance.set_meta("Page2", "Tilling is a way to prep soil and properly space out crops so that they all get equal amounts of sun and nutrients. 
")
	self.add_child(book_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
