extends Control

var main_menu_scene := "res://Assets/Scenes/main_menu.tscn"

@export var return_btn : BaseButton

func _on_return_btn_pressed() -> void:
	return_btn.grab_focus(FOCUS_NONE)
	get_tree().change_scene_to_file(main_menu_scene)
