extends Node

@export var game_scene : Node
const ENEMY : PackedScene = preload("res://Assets/Actors/civil_enemy.tscn")

func _physics_process(delta: float) -> void:
	while get_child_count() - 1 < game_scene.points / 3:
		var enemy = ENEMY.instantiate()
		add_child(enemy)
