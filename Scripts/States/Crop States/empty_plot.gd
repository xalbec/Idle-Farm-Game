extends State

@export
var tilled_state: State

func enter() -> void:
	parent.plot.play("empty")
	parent.crop.play("empty")

func process_input(event: InputEvent) -> State:
	if parent.is_targeted and event.is_action_pressed("dig"):
		return tilled_state
	return null
