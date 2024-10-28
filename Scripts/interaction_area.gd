extends Area2D
class_name InteractionArea

@export 
var action_name: String = "interact"

# Seemingly like an abstract method called interact()
# that is able to be overwritten by other instances of this class
var interact: Callable = func():
	pass

func _on_ready() -> void:
	pass

func _on_body_entered(_body: Node2D) -> void:
	InteractionManager.register_area(self)

func _on_body_exited(_body: Node2D) -> void:
	InteractionManager.unregister_area(self)
