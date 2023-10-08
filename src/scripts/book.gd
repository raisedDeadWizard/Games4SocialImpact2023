extends Node2D


var book 

var ind = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	book = [
	get_meta("Page1"),
	get_meta("Page2")
	]
	_updateText()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass	
	
	
func _updateText():
	$Label1.text = book[ind*2]
	if(book.size() != ind*2+1):
		$Label2.text = book[ind*2+1]
	else:
		$Label2.text = ""
