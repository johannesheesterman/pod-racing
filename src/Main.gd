extends Node

var player1Meshes = []

func grid_to_world(pos):
	return Vector2(pos.x - 1, -pos.y  + 1)

func initialize_players():
	var p1Scene = preload("res://Player1Character.tscn")
	var p2Scene = preload("res://Player2Character.tscn")

	for i in range(3):
		var p1Instance = p1Scene.instance()
		player1Meshes.append(p1Instance)
		var p2Instance = p2Scene.instance()
		
		p1Instance.transform.origin = Vector3(-1 + i, 0, 2)
		p2Instance.transform.origin = Vector3(-2, 0, -1 + i)
			
		add_child(p1Instance)
		add_child(p2Instance)

func move_to_position(node, grid_pos):
	var newPos = grid_to_world(grid_pos)
	node.transform.origin = Vector3(newPos.x, 0, newPos.y)
	
func _on_Grid_grid_clicked(position):
	print(position)

	move_to_position(player1Meshes[position.x], position)

func _ready():
	initialize_players();
	
