extends State

func enter() -> void:
	anim_name = "tilled"
	parent.plot.play("tilled")
	parent.crop.play("empty")

func process_input(event: InputEvent) -> State:
	return null
