extends RigidBody2D

signal clicked

var held = false
var collisionNode = null
var spriteNode = null
var object_rect = null

var sprites : Array = []
var heights : Array = [80, 40, 140, 100]
var rng = RandomNumberGenerator.new()


func _ready():
	collisionNode = get_node("book_collision")
	spriteNode = get_node("book_sprite")
	
	sprites.append(load("res://src/assets/bookMinigame/book1blue.png"))
	sprites.append(load("res://src/assets/bookMinigame/book1green.png"))
	sprites.append(load("res://src/assets/bookMinigame/book1red.png"))
	sprites.append(load("res://src/assets/bookMinigame/book2blue.png"))
	sprites.append(load("res://src/assets/bookMinigame/book2green.png"))
	sprites.append(load("res://src/assets/bookMinigame/book2red.png"))
	sprites.append(load("res://src/assets/bookMinigame/book3blue.png"))
	sprites.append(load("res://src/assets/bookMinigame/book3green.png"))
	sprites.append(load("res://src/assets/bookMinigame/book3red.png"))
	sprites.append(load("res://src/assets/bookMinigame/book4blue.png"))
	sprites.append(load("res://src/assets/bookMinigame/book4green.png"))
	sprites.append(load("res://src/assets/bookMinigame/book4red.png"))
	
	var num = rng.randi_range(0,11)
	var x_pos = rng.randi_range(0,1000)
	var shape = RectangleShape2D.new()
	shape.set_size(Vector2(330,heights[num/3]))
	spriteNode.texture = sprites[num]
	collisionNode.set_shape(shape)
	self.global_position.x = x_pos
	self.mass = .5 + 0.1*num/3
	
	

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if _is_within_rect(get_global_mouse_position(),collisionNode.get_shape().get_rect()):
				if Global.is_minigame_ready:
					emit_signal("clicked",self)
			
func _is_within_rect(m, rect):
	var x = collisionNode.global_position.x + rect.position.x
	var y = collisionNode.global_position.y + rect.position.y
	var width = rect.size.x
	var height = rect.size.y
	
	if (m.x < x or m.y < y or m.x > x+width or m.y > y+height):
		return false
	return true

func _physics_process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()
		
		
func pickup():
	if held:
		return
	held = true

func drop(impulse=Vector2.ZERO):
	if held:
		apply_central_impulse(impulse)
		held = false
