extends Node2D

@onready var state_machine: Node = $StateMachine
@onready var plot: AnimatedSprite2D = $Plot
@onready var crop: AnimatedSprite2D = $Crop

func _ready() -> void:
	# Initialize the state machine by passing a self reference for the states to use
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float):
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_interaction_zone_body_entered(body: Node2D) -> void:
	print("Hi")
