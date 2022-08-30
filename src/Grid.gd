extends Spatial

signal clicked(position)

func _on_StaticBody_input_event(_camera, event, position, _normal, _shape_idx):
	if event.is_action_released("left_click"):
		var pos = Utils.world_to_grid(position)
		if pos.x < 0 or pos.x > 2 or pos.y < 0 or pos.y > 2: return
		emit_signal("clicked", pos)
