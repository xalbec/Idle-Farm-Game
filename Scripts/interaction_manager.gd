extends Node2D

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")

const BASE_TEXT = ""

var active_areas = []
var can_interact = true

func register_area(area: InteractionArea):
	active_areas.push_back(area)

func unregister_area(area: InteractionArea):
	var index = active_areas.find(area)
	area.hide_label()
	if index != -1:
		active_areas.remove_at(index)

func _process(delta):
	if active_areas.size() > 0 && can_interact:
		active_areas.sort_custom(_sort_by_distance_to_player)
		active_areas[0].show_label()
#		label.text = BASE_TEXT + active_areas[0].action_name
#		label.global_position = active_areas[0].global_position
#		label.global_position.y -= 36
#		label.global_position.x -= label.size.x / 2
#		label.show()
#	else:
		

# Parameters: 2 different areas that the player is standing inside
# Returns: true if area1 is closer, false if area2 is closer.
func _sort_by_distance_to_player(area1, area2):
	var area1_to_player = player.global_position.distance_to(area1.global_position)
	var area2_to_player = player.global_position.distance_to(area2.global_position)
	return area1_to_player < area2_to_player

func _input(event):
	if event.is_action_pressed("interact") && can_interact:
		if active_areas.size() > 0:
			can_interact = false
			active_areas[0].hide_label()
			
			await active_areas[0].interact.call()
			
			can_interact = true
