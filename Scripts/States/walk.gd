extends State

@export
var idle_state: State
# Directions of motion
var move_x = 0
var move_y = 0

func process_frame(delta: float) -> State:
	if move_x == -1:
		parent.last_dir = parent.Directions.left
		animation_name = "walk_2"
	elif move_x == 1:
		parent.last_dir = parent.Directions.right
		animation_name = "walk_0"
	elif move_y == -1:
		parent.last_dir = parent.Directions.up
		animation_name = "walk_3"
	elif move_y == 1:
		parent.last_dir = parent.Directions.down
		animation_name = "walk_1"
	else:
		return idle_state
	parent.animated_sprite.play(animation_name)
	return null

func process_physics(delta: float) -> State:
	move_x = Input.get_axis("move_left", "move_right")
	move_y = Input.get_axis("move_up", "move_down")
	parent.position.x += move_x * move_speed * delta
	parent.position.y += move_y * move_speed * delta
	parent.move_and_slide()
	return null
