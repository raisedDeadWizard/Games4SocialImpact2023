extends Node2D

# Selected color.
# Green = 0
# Yellow = 1
# Red = 2
var handType = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	_updateGloveGUI() # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_Z:
			handType = 0
			_updateGloveGUI()
		if event.pressed and event.keycode == KEY_X:
			handType = 1
			_updateGloveGUI()
		if event.pressed and event.keycode == KEY_C:
			handType = 2
			_updateGloveGUI()

func _updateGloveGUI():
	$SelectedTool/Green.modulate.a = 0.5
	$SelectedTool/Yellow.modulate.a = 0.5
	$SelectedTool/Red.modulate.a = 0.5
	
	match handType:
		0:
			$SelectedTool/Green.modulate.a = 1
		1:
			$SelectedTool/Yellow.modulate.a = 1
		2:
			$SelectedTool/Red.modulate.a = 1
