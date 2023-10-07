extends RigidBody2D

signal clicked

var held = false
var collisionNode = null
var spriteNode = null
var object_rect = null

var sprites : Array = []
var heights : Array = [80,40]

func _ready():
	collisionNode = get_node("book_collision")
	spriteNode = get_node("book_sprite")
	
	sprites.append(load("res://src/assets/bookMinigame/book1blue.png"))
	sprites.append(load("res://src/assets/bookMinigame/book2green.png"))
	sprites.append(load("res://src/assets/bookMinigame/book3red.png"))
	sprites.append(load("res://src/assets/bookMinigame/book4blue.png"))
	
	spriteNode.texture = sprites[1]
	collisionNode.set_shape(Rect2(collisionNode.position,Vector2(330,heights[1])))
	
	

func _input(event):
	#print("event")
	if event is InputEventMouseButton:
		print("mouse button")
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("left")
			if _is_within_rect(get_global_mouse_position(),collisionNode.get_shape().get_rect()):
				emit_signal("clicked",self)
				print("CLICKED")
			
func _is_within_rect(m, rect):
	var x = collisionNode.global_transform.origin.x + rect.position.x
	var y = collisionNode.global_transform.origin.y + rect.position.y
	var width = rect.size.x
	var height = rect.size.y
	print("x: ",x," y: ",y)
	print("mouse: ", m)
	
	if (m.x < x or m.y < y or m.x > x+width or m.y > y+height):
		return false
	return true

func _physics_process(delta):
	#print(get_global_mouse_position())
	if held:
		global_transform.origin = get_global_mouse_position()
		
		
func pickup():
	if held:
		return
	held = true
	print("pickup")

func drop(impulse=Vector2.ZERO):
	if held:
		apply_central_impulse(impulse)
		held = false
		print("drop")
