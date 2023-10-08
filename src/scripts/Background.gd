extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready(curr):
	var curr = get_meta()
	
	if curr == 1:
			$Sprite/Post.set_visibility_layer_bit(0, false)
			$Sprite/Industry.set_visibility_layer_bit(0, false)
		
		if curr == 2:
			$Sprite/Post.set_visibility_layer_bit(0, false)
			$Sprite/Pre.set_visibility_layer_bit(0, false)
			
		if curr == 3:
			$Sprite/Industry.set_visibility_layer_bit(0, false)
			$Sprite/Pre.set_visibility_layer_bit(0, false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
		
		
