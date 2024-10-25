extends Node2D

@onready var game_manager: Node = %GameManager
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var label: Label = $Label

func _ready() -> void:
	interaction_area.set_label("[E] Sell")
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	game_manager.sellItems()

func _process(_delta: float) -> void:
	
	label.text = "+$" + str(game_manager.getcarrotAmount() * 2)
