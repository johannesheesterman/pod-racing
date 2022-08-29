extends Node

const player1 = []
const player2 = []

func initialize_players():
	var p1Scene = preload("res://Player1Character.tscn")
	var p2Scene = preload("res://Player2Character.tscn")

	for i in range(3):
		player1.append(p1Scene.instance())
		player2.append(p2Scene.instance())

func _ready():
	initialize_players();
