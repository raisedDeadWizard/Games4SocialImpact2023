extends Node2D

var bookNode = preload("res://src/scenes/book.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var book_instance = bookNode.instantiate()
	book_instance.set_meta("Page1", "Pesticides were first recorded in 4,500 BCE, and have developed and changed overtime since then. Organic versions of pesticides started to show up in the 30s and 50s. ")
	book_instance.set_meta("Page2", "Organic insecticides are food safe and safe to use on plants and still do their intended job of keeping pests and insects away from crops.")
	self.add_child(book_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
