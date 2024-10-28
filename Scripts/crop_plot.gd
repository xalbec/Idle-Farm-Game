extends Node2D

@onready var state_machine: Node = $StateMachine
@onready var plot: AnimatedSprite2D = $Plot
@onready var crop: AnimatedSprite2D = $Crop

var crop_name: String
var growth_stage: int = 0
var is_targeted: bool = false

func _ready() -> void:
	# Initialize the state machine by passing a self reference for the states to use
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float):
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_area_entered(area: Node2D) -> void:
	is_targeted = true

func _on_area_exited(area: Node2D) -> void:
	is_targeted = false
