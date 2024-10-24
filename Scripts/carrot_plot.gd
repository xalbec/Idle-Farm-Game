extends Node2D

@onready var game_manager = %GameManager
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var interaction_area: InteractionArea = $InteractionArea


#Takes this long to grow (in seconds)
var growthTime = 5
#Stage of growth
var growthStage = 1;

#perform when seed is planted
func _on_ready() -> void:
	timer.wait_time = growthTime
	interaction_area.set_label("[E] Plant")
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if growthStage == 1:
		sow_seeds()
		timer.start()
		interaction_area.set_label("")
	if growthStage == 5:
		harvest()
		

func _on_timer_timeout() -> void:
	grow()

#Progresses the growth by 1 stage when called
func grow():
	if(growthStage > 1 and growthStage < 5):
		growthStage += 1
		animated_sprite_2d.play("stage_" + str(growthStage))
	if(growthStage == 5):
		interaction_area.set_label("[E] Harvest")

func sow_seeds():
	growthStage += 1
	animated_sprite_2d.play("stage_" + str(growthStage))

func harvest():
	growthStage = 1;
	animated_sprite_2d.play("stage_" + str(growthStage))
	game_manager.collectItem()
