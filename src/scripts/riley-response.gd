extends Node2D

var dialogList = Global.riley_dialog
var text_queue = []
var queue_ind = 0

func _ready():
	Global.is_done_talking = false
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
	$Background/textbox/Label.visible_characters = 0
	$Background/textbox/Label.text = text_queue[0]



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Background/textbox/Label.visible_characters == $Background/textbox/Label.text.length():
		Global.is_done_talking = true
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		print(event)
		if event.is_pressed() && Global.is_done_talking:
			if queue_ind < text_queue.size() - 1:
				_nextDialog()
			else:
				get_tree().change_scene_to_file("res://src/scenes/main.tscn")

func _nextDialog():
	queue_ind += 1
	Global.is_done_talking = false
	$Background/textbox/Label.visible_characters = 0
	$Background/textbox/Label.text = text_queue[queue_ind]
	
