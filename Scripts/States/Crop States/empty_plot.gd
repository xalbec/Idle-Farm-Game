extends State

func enter() -> void:
	anim_name = "tilled"
	parent.plot.play("empty")
	parent.crop.play("empty")
