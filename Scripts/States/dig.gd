extends State

@export
var idle_state: State
@export
var walk_state: State

func enter() -> void:
	anim_name = "dig"
	player_anim_play()

func process_frame(delta: float) -> State:
	if parent.body.frame == 12:
		return idle_state
	return null
