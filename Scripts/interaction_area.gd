extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"
@onready var label: Label = $Label

# Seemingly like an abstract method called interact()
# that is able to be overwritten by other instances of this class
var interact: Callable = func():
	pass

func _on_ready() -> void:
	label.hide()

func _on_body_entered(_body: Node2D) -> void:
	InteractionManager.register_area(self)

func _on_body_exited(_body: Node2D) -> void:
	InteractionManager.unregister_area(self)

func show_label():
	label.show()

func hide_label():
	label.hide()

func set_label(text):
	label.text = text
