extends Label

# Prints 8 characters a second.
const TEXT_SPEED = 0.125

var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = 0
	visible_characters = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if(timer >= TEXT_SPEED):
		timer -= TEXT_SPEED
		visible_characters += 1
