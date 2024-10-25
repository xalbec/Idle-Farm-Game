class_name Player
extends CharacterBody2D

@onready var body: AnimatedSprite2D = $Body
@onready var hair: AnimatedSprite2D = $Hair
@onready var hand: AnimatedSprite2D = $Hand
@onready var state_machine: Node = $StateMachine

enum Directions {right, down, left, up}
var last_dir = Vector2.RIGHT
const SPEED = 60.0

func _ready() -> void:
	# Initialize the state machine by passing a player reference for the states to use
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta):
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
