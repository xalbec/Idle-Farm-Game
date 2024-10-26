extends Node

@export
var starting_state: State

var current_state: State

# When the machine is initialized, it will set all of the child States' parent variable to Player
func init(parent: Node2D) -> void:
	for child in get_children():
		child.parent = parent
	
	# Initialize the default state
	change_state(starting_state)

# Change to new State by calling the exit function of the current State
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	# Start the new State by calling its enter function
	current_state = new_state
	current_state.enter()

# Pass through functions for the Player to call
# Change states as needed
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
