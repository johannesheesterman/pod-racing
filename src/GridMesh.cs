using Godot;
using System;

public class GridMesh : MeshInstance
{
	private Camera _camera;

	public override void _Ready()
	{
		_camera = GetNode<Camera>("../../Camera");
	}

	public override void _Process	(float delta)
	{
		if (Input.IsActionPressed("left_click"))
		{
			var spaceState = GetWorld().DirectSpaceState;
			var mousePosition = GetViewport().GetMousePosition();
			var rayOrigin = _camera.ProjectRayNormal(mousePosition);
			var rayEnd = rayOrigin * 10000;

			var intersections = spaceState.IntersectRay(rayOrigin, rayEnd);
			
			if (intersections.Count == 0) return;
		}
	}
}
