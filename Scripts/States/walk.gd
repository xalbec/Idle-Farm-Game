extends State

@export
var idle_state: State
# Directions of motion
var move_dir = Vector2.ZERO

func enter() -> void:
	anim_name = "walk"
	super()

func process_frame(delta: float) -> State:
	if move_dir.x < 0:
		parent.last_dir = Vector2.LEFT
		flip_anim(true)
	elif move_dir.x > 0:
		parent.last_dir = Vector2.RIGHT
		flip_anim(false)
	elif move_dir == Vector2.ZERO:
		return idle_state
	parent.body.play(anim_name)
	parent.hair.play(anim_name)
	return null

func process_physics(delta: float) -> State:
	move_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	parent.position += move_dir * move_speed * delta
	parent.move_and_slide()
	return null
