class_name State
extends Node

@export
var anim_name: String
@export
var move_speed: float = 60

# Holds a reference to the Player 
var parent: Player

func enter() -> void:
	parent.body.play(anim_name)
	parent.hair.play(anim_name)
	parent.hand.play(anim_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null

func flip_anim(b: bool) -> void:
	parent.body.flip_h = b
	parent.hair.flip_h = b
	parent.hand.flip_h = b
