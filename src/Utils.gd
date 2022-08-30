extends Node

static func world_to_grid(position) -> Vector2:
	return Vector2(round(position.x) + 1, (-round(position.z) + 1))
	
static func grid_to_world(pos) -> Vector2:
	return Vector2(pos.x - 1, -pos.y  + 1)
