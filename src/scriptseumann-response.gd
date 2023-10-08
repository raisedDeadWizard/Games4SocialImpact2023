extends Node2D

var eumann = preload("res://src/scenes/characters/pre-industrial/eumann/eumann_char.tscn")
var town = preload("res://src/scenes/pre-industry.tscn")
var bkgd = preload("res://src/scenes/Background.tscn")
var tree = preload("res://src/scenes/Tree.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var treeNode = tree.instantiate()
	treeNode.set_meta("Health", 1)
	var bkgdNode = bkgd.instantiate()
	var townNode = town.instantiate()
	var eumannNode = eumann.instantiate()
	
	bkgdNode.add_child(townNode)
	bkgdNode.add_child(treeNode)
	bkgdNode.add_child(eumannNode)
	add_child(bkgdNode)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventMouseButton:
		print(event)
		if event.is_pressed():
			get_tree().change_scene_to_file("res://src/scenes/pre-industrial/walden-response.tscn")
