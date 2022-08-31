extends Node

enum Tile { Player1, Player2, Empty }
var grid = []
var player1Meshes = []

func initialize_grid():
	for i in range(3):
		grid.append([])
		for _j in range(3):
			grid[i].append(Tile.Empty)

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
	var newPos = Utils.grid_to_world(grid_pos)
	node.transform.origin = Vector3(newPos.x, 0, newPos.y)
	
func is_valid_move(start: Vector2, target: Vector2):
	print([start, target])

	if start.x != target.x: return false
	if target.y < start.y: return false
	if grid[target.x][target.y] != Tile.Empty: return false
		
	if target.y - start.y == 1: return true
	if target.y - start.y == 2 and grid[target.x][target.y - 1] == Tile.Player2: return true 
	
	return false
	
	
func _on_Grid_clicked(position):
	if is_valid_move(Utils.world_to_grid(player1Meshes[position.x].transform.origin), position):
		move_to_position(player1Meshes[position.x], position)

func _ready():
	initialize_grid()
	initialize_players()
