extends Node2D

# Selected color.
# Green = 0
# Yellow = 1
# Red = 2
var matrix = []
var times = []
var timer = 0
var ind = 0
var rng = RandomNumberGenerator.new()
var plamt = preload("res://src/scenes/plamt.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$CommonGame.set_meta("Dest",2)
	for x in range(5):
		matrix.append([])
		matrix[x]=[]        
		for y in range(3):
			matrix[x].append([])
			matrix[x][y] = false
	_generateTimes()
	_updateGloveGUI() # Replace with function body.
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($CommonGame.get_meta("Toggle")):
		timer += delta
		if(ind < 30 && timer > times[ind]):
			_spawnPlant()
			ind += 1


func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and (event.keycode == KEY_Z || event.keycode == KEY_LEFT):
			self.set_meta("SelectedTool", 0)
			_updateGloveGUI()
		if event.pressed and (event.keycode == KEY_X || event.keycode == KEY_UP || event.keycode == KEY_DOWN):
			self.set_meta("SelectedTool", 1)
			_updateGloveGUI()
		if event.pressed and (event.keycode == KEY_C || event.keycode == KEY_RIGHT):
			self.set_meta("SelectedTool", 2)
			_updateGloveGUI()

func _updateGloveGUI():
	$SelectedTool/Green.modulate.a = 0.5
	$SelectedTool/Yellow.modulate.a = 0.5
	$SelectedTool/Red.modulate.a = 0.5

	match self.get_meta("SelectedTool"):
		0:
			$SelectedTool/Green.modulate.a = 1
		1:
			$SelectedTool/Yellow.modulate.a = 1
		2:
			$SelectedTool/Red.modulate.a = 1

func _generateTimes():
	for x in range(11):
		times.append(rng.randf_range(0.00, 15.00))
	for x in range(11):
		times.append(rng.randf_range(15.00, 30.00))
	for x in range(8):
		times.append(4 * x)
	times.sort()

func _spawnPlant():
	var spots = range(15)
	randomize()
	spots.shuffle()
	for x in range(15):
		var xpos = floor(spots[x] / 3)
		var ypos = spots[x] % 3
		if !matrix[xpos][ypos]:
			var newplamt = plamt.instantiate()
			newplamt.global_position.x = 200 + xpos * 300
			newplamt.global_position.y = 150 + ypos * 200
			matrix[xpos][ypos] = true
			newplamt.set_meta("x", xpos)
			newplamt.set_meta("y", ypos)
			newplamt._connectButt()
			$Weeds.add_child(newplamt)
			newplamt.connect("clickButt", clickPant)
			return

func clickPant(object):
	var x = object.get_meta("x")
	var y = object.get_meta("y")
	matrix[x][y] = false
	var score = $CommonGame.get_meta("Score")
	$CommonGame.set_meta("Score", score + 10)
	object.queue_free()
