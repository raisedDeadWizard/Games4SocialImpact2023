extends Node2D

var held_object = null
@onready var pickable_container = $pickable
var book = preload("res://src/scenes/stackable.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$CommonGame.get_node("Timer").set_meta("Timer Duration", 15)
	_create_books()
	for node in $pickable.get_children():
		node.connect("clicked", _on_pickable_clicked)
	
func _on_pickable_clicked(object):
	if !held_object:
		held_object = object
		held_object.pickup()
		
func _check_score():
	var start = pickable_container.get_child(0)
	Global.highest_book = start.global_position.y
	for node in pickable_container.get_children():
		if node.global_position.y < Global.highest_book:
			Global.highest_book = node.global_position.y
			
	if Global.highest_book < 0:
		$CommonGame.set_meta("Score",300)
	else:
		var s = snapped(300 - Global.highest_book/2, 0)
		if s < 0:
			s = 0
		$CommonGame.set_meta("Score",s)
		
func _create_books():
	
	for n in Global.num_books:
		var instance = book.instantiate()
		pickable_container.add_child(instance)
		
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if held_object and !event.pressed:
			held_object.drop(Input.get_last_mouse_velocity())
			held_object = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.is_minigame_ready:
		_check_score()
	
func _physics_process(delta):
	pass

func _input(event):
	pass



