extends Button

signal clickButt

var s0 = preload("res://src/assets/gardenMinigame/dandelion.png")
var s1 = preload("res://src/assets/gardenMinigame/overLeafedPlant.png")
var s2 = preload("res://src/assets/gardenMinigame/dyingPlant.png")

var sprites = [s0, s1, s2]


var rng = RandomNumberGenerator.new()
var index
var x
var y
# Called when the node enters the scene tree for the first time.
func _ready():
	index = rng.randi_range(0, 2)
	self.pressed.connect(_buttPush)
	self.icon = sprites[index]
	


func _buttPush():
	if(get_parent().get_parent().get_meta("SelectedTool") == index):
		emit_signal("clickButt", self)


func _connectButt():
	x = self.get_meta("x")
	y = self.get_meta("y")
