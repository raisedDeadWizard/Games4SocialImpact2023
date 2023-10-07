extends Node2D


const numOfDroplets = 10
var currNumOfDroplets = 0

var timer = 0
var lastSpawned = 0
var offset = 0
var totalScore = 0
var scoreIncrement = 10

var rng = RandomNumberGenerator.new()
var dropletNode = preload("res://src/scenes/Droplet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = 0 # Replace with function body.
	offset = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	_spawnDroplet(delta)
	
	
func _unhandled_input(event):
	if event is InputEventKey:
		var dir
		if event.pressed and event.keycode == KEY_LEFT:
			dir = "l"
		if event.pressed and event.keycode == KEY_UP:
			dir = "c"
		if event.pressed and event.keycode == KEY_RIGHT:
			dir = "r"
		if dir:
			_checkPlayerInput(dir)
	
func _spawnDroplet(delta):
		if currNumOfDroplets < numOfDroplets:
			var timeElapsed = timer - lastSpawned
			if timeElapsed >= offset:
				var r = rng.randi_range(1, 3)
				if r == 1:
					_emitDroplet(-190)
				if r == 2:
					_emitDroplet(0)
				if r == 3:
					_emitDroplet(190)
				currNumOfDroplets += 1
				lastSpawned = timer
	
	
func _emitDroplet(dir):
	var dropletNode_instance = dropletNode.instantiate()
	$Background.add_child(dropletNode_instance)
	dropletNode_instance.position.x = dir
	dropletNode_instance.position.y = -500
	

func _checkPlayerInput(dir):
	
	var rec
	var hit

	if dir == "l":
		rec = $Background/Left/Receiver
		hit = rec.get_overlapping_bodies()
		
	if dir == "c":
		rec = $Background/Center/Receiver
		hit = rec.get_overlapping_bodies()
		
	if dir == "r":
		rec = $Background/Right/Receiver
		hit = rec.get_overlapping_bodies()
	
	if hit:
		var i = hit.find(dropletNode)
		var drop = hit[i]
		drop.hide()
		_addScore()
		print("Current Score: ", totalScore)
		
func _addScore():
	totalScore += scoreIncrement
	
	
		
