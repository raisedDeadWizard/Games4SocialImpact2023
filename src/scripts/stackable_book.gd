extends RigidBody2D

signal clicked

var held = false
# Called when the node enters the scene tree for the first time.
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			emit_signal("clicked",self)
			
func _physics_process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()
		
func pickup():
	if held:
		return
	set_deferred("mode", FREEZE_MODE_STATIC)
	held = true

func drop(impulse=Vector2.ZERO):
	if held:
		set_deferred("mode", FREEZE_MODE_KINEMATIC) 
		apply_central_impulse(impulse)
		held = false
