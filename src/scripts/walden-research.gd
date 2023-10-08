extends Node2D

var bookNode = preload("res://src/scenes/book.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var book_instance = bookNode.instantiate()
	book_instance.set_meta("Page1", "Attempts to remove weeds have been around since 10,000 BCE, but came into full swing during Roman and Medieval times. ")
	book_instance.set_meta("Page2", "Manual weed removal before planting is done as part of pre-planting before you even put seeds in the soil. 
")
	self.add_child(book_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
