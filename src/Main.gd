extends Node

func initialize_players():
	var p1Scene = preload("res://Player1Character.tscn")
	var p2Scene = preload("res://Player2Character.tscn")

	for i in range(3):
		var p1Instance = p1Scene.instance()
		var p2Instance = p2Scene.instance()
		
		p1Instance.transform.origin = Vector3(-1 + i, 0, 2)
		p2Instance.transform.origin = Vector3(-2, 0, -1 + i)
			
		add_child(p1Instance)
		add_child(p2Instance)

func _ready():
	initialize_players();
