extends Node

const carrotItem = preload("res://Scenes/carrot_item.tscn")
@onready var player: CharacterBody2D = %Player
@onready var money_label: Node2D = %Player/Camera2D/ResourceLabel


const PLAYER_HEAD_OFFSET = Vector2(0,-21)
var carrotAmount = 0;
var carrotInstance

var moneyAmount = 0;

func popupCarrot():
	carrotInstance = carrotItem.instantiate()
	carrotInstance.position = player.position + PLAYER_HEAD_OFFSET
	add_child(carrotInstance)

func collectItem():
	carrotAmount += 1
	popupCarrot()

func sellItems():
	moneyAmount += carrotAmount*2
	carrotAmount = 0
	money_label.set_text("$" + str(moneyAmount))

func getcarrotAmount():
	return carrotAmount
