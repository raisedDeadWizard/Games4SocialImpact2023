extends Node2D


const numOfDroplets = 10
var currNumOfDroplets = 0

var timer = 0
var lastSpawned = 0
var offset = 0

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
	_checkPlayerInput()

	
func _spawnDroplet(delta):
		if currNumOfDroplets < numOfDroplets:
			var timeElapsed = timer - lastSpawned
			if timeElapsed >= offset:
				var r = rng.randi_range(1, 3)
				if r == 1:
					print("Left Droplet Spawned") # spawn here
					
					_emitDroplet(-190)
				if r == 2:
					print("Center Droplet Spawned")
					_emitDroplet(0)
				if r == 3:
					print("Right Droplet Spawned")
					_emitDroplet(190)
				currNumOfDroplets += 1
				lastSpawned = timer
	
	
func _emitDroplet(dir):
	var dropletNode_instance = dropletNode.instantiate()
	$Background.add_child(dropletNode_instance)
	dropletNode_instance.position.x = dir
	dropletNode_instance.position.y = -500
	

func _checkPlayerInput():
	# get player input
	# check if it is r-arrow, u-arrow, or l-arrow
	var rec
	var hit
	
	if Input.is_action_pressed("ui_left"):
		print("Left pressed")
		rec = $Background/Left/Receiver
		hit = rec.has_overlapping_bodies()
		
	if Input.is_action_pressed("ui_up"):
		print("Center pressed")
		rec = $Background/Center/Receiver
		hit = rec.has_overlapping_bodies()
		
	if Input.is_action_pressed("ui_right"):
		print("Right pressed")
		rec = $Background/Right/Receiver
		hit = rec.has_overlapping_bodies()
	
	if hit:
		print("Successful Hit!")
	
		
