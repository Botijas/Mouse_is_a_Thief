extends Control

var main_menu_scene := "res://Assets/Scenes/main_menu.tscn"

@export var return_btn : BaseButton
@export var return_sfx: AudioStreamPlayer

@export var menu: MarginContainer

func _on_return_btn_pressed() -> void:
	return_sfx.play()
	visible = false
	menu.visible = true
