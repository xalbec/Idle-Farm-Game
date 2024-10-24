class_name State
extends Node

@export
var animation_name: String
@export
var move_speed: float = 60

# Holds a reference to the Player 
var parent: Player

func enter() -> void:
	parent.animated_sprite.play(animation_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
