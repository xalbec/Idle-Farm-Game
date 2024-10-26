extends State

@export
var idle_state: State
@export
var walk_state: State

#time in SECONDS necessary for "watering" to be finished
var duration = 0

func enter() -> void:
	duration = 0
	anim_name = "water"
	player_anim_play()

func process_frame(delta: float) -> State:
	duration += delta
	if duration > 0.4:
		if Input.get_vector("move_left", "move_right", "move_up", "move_down") != Vector2(0,0):
			return walk_state
		else:
			return idle_state
	return null
