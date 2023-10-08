extends Node

var num_books = 9
var is_minigame_ready = false
var highest_book = 1000

var max_drops = 0

var totalScoreCurrAct = 0
var totalScore = 0

var scene_array : Array = [
	# exposition
	
	"res://src/scenes/StartMenu.tscn",
	"res://src/scenes/TreeExpo.tscn",
	"res://src/scenes/PlayerExpo.tscn",
	
	# act 1
	
	"res://src/scenes/act1/akelda-prompt.tscn",
	"res://src/scenes/Garden.tscn",
	"res://src/scenes/act1/akelda-research.tscn",
	"res://src/scenes/act1/akelda-response.tscn",
	
	"res://src/scenes/act1/eumann-prompt.tscn",
	"res://src/scenes/Weed.tscn",
	"res://src/scenes/act1/eumann-research.tscn",
	"res://src/scenes/act1/eumann-response.tscn",
	
	"res://src/scenes/act1/walden-prompt.tscn",
	"res://src/scenes/book_stack.tscn",
	"res://src/scenes/act1/walden-research.tscn",
	"res://src/scenes/act1/walden-response.tscn"
	
	# act 2
]
var scene_index = -1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
