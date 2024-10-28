extends State

@export
var growing_state: State

func enter() -> void:
	anim_name = "tilled"
	parent.plot.play("tilled")
	play_frame("beet", 0)

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("water") and parent.is_targeted:
		return growing_state
	return null
