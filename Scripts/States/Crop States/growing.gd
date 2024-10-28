extends State

@export
var harvested_state: State

var test_timer = 0

func enter() -> void:
	anim_name = "tilled"
	parent.plot.play("watered")
	play_frame("beet", parent.growth_stage)

func process_frame(delta: float) -> State:
	test_timer += delta
	if test_timer > 1:
		test_timer = 0
		parent.growth_stage += 1
	parent.crop.set_frame(parent.growth_stage)
	return null
