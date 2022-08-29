extends Node

func initialize_players():
	var p1Scene = preload("res://Player1Character.tscn")
	var p2Scene = preload("res://Player2Character.tscn")

	for _i in range(3):
		var p1Instance = p1Scene.instance()
		var p2Instance = p2Scene.instance()
		
		p1Instance.transform.basis = Basis()	
			
		add_child(p1Instance)
		add_child(p2Instance)

func _ready():
	initialize_players();
