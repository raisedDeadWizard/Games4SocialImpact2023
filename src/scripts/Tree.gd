extends Node2D

var tree_sprites = [
	"res://src/assets/background/healthyTree.png",
	"res://src/assets/background/dyingTree.png",
	"res://src/assets/background/deadTree.png"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	_updateHealth()

	
func _updateHealth():
	var health = Global.tree_health
	if health == 3:
		get_tree().change_scene_to_file("res://src/scenes/GameOver.tscn")

	$TreeSprite.texture = load(tree_sprites[health])
