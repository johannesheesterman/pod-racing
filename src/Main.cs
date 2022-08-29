using Godot;
using System;

public class Main : Node
{
	Spatial[] player1 = new Spatial[3];
	Spatial[] player2 = new Spatial[3];

	public override void _Ready()
	{
		InitializePlayers();
	}

	private void InitializePlayers()
	{
		var p1Scene = (PackedScene)ResourceLoader.Load("res://Player1Character.tscn");
		var p2Scene = (PackedScene)ResourceLoader.Load("res://Player2Character.tscn");
		
		for (int i = 0; i < 3; i++)
		{
			player1[i] = (Player1Character)p1Scene.Instance();
			player2[i] = (Player2Character)p2Scene.Instance();
			AddChild(player1[i]);
			AddChild(player2[i]);
		}
	}
}
