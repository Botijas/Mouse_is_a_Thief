extends Control

@export var scene : Node

func _on_pause_btn_pressed() -> void:
	scene.pause_btn()
