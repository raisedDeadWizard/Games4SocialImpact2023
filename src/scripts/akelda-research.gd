extends Node2D

var bookNode = preload("res://src/scenes/book.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var book_instance = bookNode.instantiate()
	book_instance.set_meta("Page1", "Pruning was discovered according to a legend where a donkey nibbled on a wild grape vine and it grew more grapes as a result, and is linked to 8,000 BCE in the Caucuses.")
	book_instance.set_meta("Page2", "Pruning removes diseased, dead, or any general branches of a plant that are doing unwell. Done in early spring before blooming and after the weather starts to warm. ")
	self.add_child(book_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
