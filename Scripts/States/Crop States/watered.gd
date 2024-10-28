extends State

@export
var growing_state: State

func enter() -> void:
	parent.plot.play("watered")
	parent.crop.play("empty")

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("interact") and parent.is_targeted:
		return growing_state
	return null
