extends Node2D

@onready var label: Label = $Label

func set_text(text):
	label.text = text
