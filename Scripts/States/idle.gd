extends State

@export
var walk_state: State

func enter() -> void:
	animation_name = "idle_" + str(parent.last_dir)
	super()
 
func process_input(event: InputEvent) -> State:
	# Checks if we are moving in ANY direction
	if Input.get_vector("move_left", "move_right", "move_up", "move_down") != Vector2(0,0):
		return walk_state
	return null
