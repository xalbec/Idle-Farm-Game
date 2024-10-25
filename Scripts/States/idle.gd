extends State

@export
var walk_state: State

func enter() -> void:
	anim_name = "idle"
	if(parent.last_dir == Vector2.RIGHT):
		flip_anim(false)
	else:
		flip_anim(true)
	super()
 
func process_input(event: InputEvent) -> State:
	# Checks if we are moving in ANY direction
	if Input.get_vector("move_left", "move_right", "move_up", "move_down") != Vector2(0,0):
		return walk_state
	return null
