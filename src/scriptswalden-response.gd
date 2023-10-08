extends Node2D

var walden = preload("res://src/scenes/characters/pre-industrial/walden/walden_char.tscn")
var town = preload("res://src/scenes/pre-industry.tscn")
var bkgd = preload("res://src/scenes/Background.tscn")
var tree = preload("res://src/scenes/Tree.tscn")
var garden = preload("res://src/scenes/Garden.tscn")
var treeNode
var bkgdNode 
var townNode
var waldenNode
var alreadyPressed = false


# Called when the node enters the scene tree for the first time.
func _ready():
	treeNode = tree.instantiate()
	treeNode.set_meta("Health", 1)
	bkgdNode = bkgd.instantiate()
	townNode = town.instantiate()
	waldenNode = walden.instantiate()
	
	bkgdNode.add_child(townNode)
	bkgdNode.add_child(treeNode)
	bkgdNode.add_child(waldenNode)
	add_child(bkgdNode)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton and !alreadyPressed:
		if event.is_pressed():
			alreadyPressed = true
			waldenNode.set_visibility_layer_bit(0, false)
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
			
