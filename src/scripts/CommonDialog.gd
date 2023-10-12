extends Node2D

# var dialogList = Global.vivian_dialog
var text_queue = []
var queue_ind = 0
var dialogList
var character = ""
var act = 0

func _ready():
	Global.is_done_talking = false
	
	match Global.scene_index:
		# Act 1
		3:
			text_queue.append(Global.walden_dialog[0])
			$Background/CharSprite.texture = load(Global.sprites[0])
			character = "Walden"
		6:
			dialogList = Global.walden_dialog
			$Background/CharSprite.texture = load(Global.sprites[0])
			character = "Walden"
			_response()
		7:
			text_queue.append(Global.akleda_dialog[0])
			$Background/CharSprite.texture = load(Global.sprites[1])
			character = "Akelda"
		10:
			dialogList = Global.akleda_dialog
			$Background/CharSprite.texture = load(Global.sprites[1])
			character = "Akelda"
			_response()
		11:
			text_queue.append(Global.eumann_dialog[0])
			$Background/CharSprite.texture = load(Global.sprites[2])
			character = "Eumann"
		14:
			dialogList = Global.eumann_dialog
			$Background/CharSprite.texture = load(Global.sprites[2])
			character = "Eumann"
			_response()
		
		# Act 2
		16:
			text_queue.append(Global.harold_dialog[0])
			$Background/CharSprite.texture = load(Global.sprites[3])
			character = "Harold"
			act = 1
		19:
			dialogList = Global.harold_dialog
			$Background/CharSprite.texture = load(Global.sprites[3])
			character = "Harold"
			act = 1
			_response()
		20:
			text_queue.append(Global.gilbert_dialog[0])
			$Background/CharSprite.texture = load(Global.sprites[4])
			character = "Gilbert"
			act = 1
		23:
			dialogList = Global.gilbert_dialog
			$Background/CharSprite.texture = load(Global.sprites[4])
			character = "Gilbert"
			act = 1
			_response()
		24:
			text_queue.append(Global.judith_dialog[0])
			$Background/CharSprite.texture = load(Global.sprites[5])
			character = "Judith"
			act = 1
		27:
			dialogList = Global.judith_dialog
			$Background/CharSprite.texture = load(Global.sprites[5])
			character = "Judith"
			act = 1
			_response()
		
		# Act 3
		29:
			text_queue.append(Global.riley_dialog[0])
			$Background/CharSprite.texture = load(Global.sprites[6])
			character = "Riley"
			act = 2
		32:
			dialogList = Global.riley_dialog
			$Background/CharSprite.texture = load(Global.sprites[6])
			character = "Riley"
			act = 2
			_response()
		33:
			text_queue.append(Global.brendan_dialog[0])
			$Background/CharSprite.texture = load(Global.sprites[7])
			character = "Brendan"
			act = 2
		36:
			dialogList = Global.brendan_dialog
			$Background/CharSprite.texture = load(Global.sprites[7])
			character = "Brendan"
			act = 2
			_response()
		37:
			text_queue.append(Global.vivian_dialog[0])
			$Background/CharSprite.texture = load(Global.sprites[8])
			character = "Vivian"
			act = 2
		40:
			dialogList = Global.vivian_dialog
			$Background/CharSprite.texture = load(Global.sprites[8])
			character = "Vivian"
			act = 2
			_response()
	$Background/TownBG.texture = load(Global.bgsprites[act])
	$Background/textbox/Label2.text = character
	$Background/textbox/Label.text = text_queue[0]
	$Background/textbox/Label.visible_characters = 0


func _response():	
	text_queue.append(dialogList[1])
	var health = Global.tree_health
	if Global.totalScore >= Global.act_thresholds[0]:
		text_queue.append(dialogList[2])
		text_queue.append(dialogList[3])
		Global.tree_health = max(health - 1, 0)
	else:
		text_queue.append(dialogList[4])
		text_queue.append(dialogList[5])
		Global.tree_health = min(health + 1, 3)
	$Background/Tree._updateHealth()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $Background/textbox/Label.visible_characters == $Background/textbox/Label.text.length():
		Global.is_done_talking = true
	
func _unhandled_input(event):
	if event is InputEventMouseButton && event.is_pressed():
		if Global.is_done_talking:
			if queue_ind < text_queue.size() - 1:
				_nextDialog()
			else:
				get_tree().change_scene_to_file("res://src/scenes/main.tscn")
		else:
			$Background/textbox/Label.visible_characters = $Background/textbox/Label.text.length()

func _nextDialog():
	queue_ind += 1
	Global.is_done_talking = false
	if queue_ind % 2 == 1:
		$Background/textbox/Label2.text = "You"
	else:
		$Background/textbox/Label2.text = character
	$Background/textbox/Label.visible_characters = 0
	$Background/textbox/Label.text = text_queue[queue_ind]
	
