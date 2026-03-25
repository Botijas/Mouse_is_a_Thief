extends Control

@export_category("Scenes Refs")
@export var scene : Node
@export_category("Buttons Refs")
@export var pause_btn : BaseButton
@export var resume_btn : BaseButton
@export var back_btn : BaseButton
@export var quit_btn : BaseButton

func _on_pause_btn_pressed() -> void:
	scene.go_to_paused()
	pause_btn.set_focus_mode(FOCUS_NONE)

func _on_resume_btn_pressed() -> void:
	scene.go_to_playing() 
	resume_btn.set_focus_mode(FOCUS_NONE)

func _on_back_btn_pressed() -> void:
	
	back_btn.set_focus_mode(FOCUS_NONE) 

func _on_quit_btn_pressed() -> void:
	get_tree().quit() 
	quit_btn.set_focus_mode(FOCUS_NONE)
