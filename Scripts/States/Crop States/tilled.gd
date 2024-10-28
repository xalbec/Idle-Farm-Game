extends State

@export
var watered_state: State
@export
var planted_state: State
@export
var empty_state: State

func enter() -> void:
	parent.plot.play("tilled")
	parent.crop.play("empty")

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("interact") and parent.is_targeted:
		return planted_state
	if event.is_action_pressed("water") and parent.is_targeted:
		return watered_state
	return null
