extends Node2D


var numOfDroplets = 25
var currNumOfDroplets = 0

var maxTime = 30
var timer = 0
var lastSpawned = 0
var offset = 0
var totalScore = 0
var scoreIncrement = 10
var nextSpawn = 0
var speed = 0
var dest

var rng = RandomNumberGenerator.new()
var dropletNode = preload("res://src/scenes/Droplet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = 0 # Replace with function body.
	offset = 1
	numOfDroplets = get_meta("maxDrops")
	print(numOfDroplets)
	dest = get_meta("Dest")
	print("Garden: ", dest)
	$CommonGame.set_meta("Dest", dest)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $CommonGame.get_meta("Toggle"):
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
		if timer >= nextSpawn:
			var r = rng.randi_range(1, 3)
			var rOffset = rng.randf_range(0.5,1.5)
			if r == 1:
				_emitDroplet(-423)
			if r == 2:
				_emitDroplet(-37)
			if r == 3:
				_emitDroplet(432)
			currNumOfDroplets += 1
			nextSpawn = timer + rOffset
	
	
func _emitDroplet(dir):
	var dropletNode_instance = dropletNode.instantiate()
	$Background.add_child(dropletNode_instance)
	var popped = dropletNode_instance.get_child(2)
	popped.set_visibility_layer_bit(0, false)
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
		var children = drop.get_children()
		var sprite = children[1]
		var popped = children[2]
		
		sprite.set_visibility_layer_bit(0, false)
		popped.set_visibility_layer_bit(1, true)
		# fade opacity of popped
		
		#drop.hide()
		_addScore()
		
		
func _addScore():
	var s = $CommonGame.get_meta("Score")
	s += scoreIncrement
	$CommonGame.set_meta("Score", s)
	
		
