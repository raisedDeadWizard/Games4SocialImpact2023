extends Node2D

var walden = preload("res://src/scenes/characters/pre-industrial/walden/walden_char.tscn")
var bkgd = preload("res://src/scenes/Background.tscn")
var tree = preload("res://src/scenes/Tree.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var treeNode = tree.instantiate()
	treeNode.set_meta("Health", 1)
	var bkgdNode = bkgd.instantiate(1)
	#bkgd.set_meta("Age", 1)
	var waldenNode = walden.instantiate()
	
	bkgdNode.add_child(treeNode)
	bkgdNode.add_child(waldenNode)
	add_child(bkgdNode)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

