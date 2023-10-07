extends Node2D

var held_object = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for node in $pickable.get_children():
		node.connect("clicked", _on_pickable_clicked)
	
func _on_pickable_clicked(object):
	if !held_object:
		held_object = object
		held_object.pickup()
		
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if held_object and !event.pressed:
			held_object.drop(Input.get_last_mouse_velocity())
			held_object = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	pass

func _input(event):
	pass



