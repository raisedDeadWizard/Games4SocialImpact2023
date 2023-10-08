extends Node2D

var bookNode = preload("res://src/scenes/book.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var book_instance = bookNode.instantiate()
	book_instance.set_meta("Page1", "It is believed that farmers were using fertilizer as far back as 8,000 BCE, but chemically based fertilizer originates in the mid-19th century in Germany.")
	book_instance.set_meta("Page2", "Chemical fertilizers have key nutrients added into them to maximize the amount of nutrients plants receive and can use in the growth process. 
")
	self.add_child(book_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
