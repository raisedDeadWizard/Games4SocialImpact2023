extends Label

const TEXT_SPEED = 0.03125
var timer
var isDone = false

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = 0
	visible_characters = 0 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	var chartime = max(floor(timer * 32) - 32, 0)
	visible_characters = chartime
	if(visible_characters == text.length()):
		isDone = true


func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() && isDone:
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
