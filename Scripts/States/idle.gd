extends State

@export
var walk_state: State
@export
var water_state: State
@export
var dig_state: State

func enter() -> void:
	anim_name = "idle"
	player_anim_play()

func process_input(event: InputEvent) -> State:
	# Checks if we are moving in ANY direction
	if Input.get_vector("move_left", "move_right", "move_up", "move_down") != Vector2(0,0):
		return walk_state
	elif event.is_action_pressed("water", false):
		return water_state
	elif event.is_action_pressed("dig", false):
		return dig_state
	return null
