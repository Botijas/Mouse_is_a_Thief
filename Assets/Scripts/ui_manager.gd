extends Control

@export_category("Scenes Refs")
@export var game_scene : Node
@export_category("Buttons Refs")
@export var pause_btn : BaseButton
@export var resume_btn : BaseButton
@export var back_btn : BaseButton
@export var quit_btn : BaseButton
@export var restart_btn : BaseButton
@export_category("Score Refs")
@export var score : Label
@export var last_score : Label
@export var high_score : Label

func _physics_process(delta: float) -> void:
	score.text = str(game_scene.points)

func set_scores_on_labels() -> void:
	last_score.text = str(game_scene.points)
	high_score.text = str(game_scene.high_score)

func _on_pause_btn_pressed() -> void:
	game_scene.go_to_paused()
	pause_btn.set_focus_mode(FOCUS_NONE)

func _on_resume_btn_pressed() -> void:
	game_scene.go_to_playing() 
	resume_btn.set_focus_mode(FOCUS_NONE)

func _on_back_btn_pressed() -> void:
	back_btn.set_focus_mode(FOCUS_NONE) 

func _on_quit_btn_pressed() -> void:
	get_tree().quit() 
	quit_btn.set_focus_mode(FOCUS_NONE)

func _on_restart_btn_pressed() -> void:
	get_tree().reload_current_scene()
	game_scene.read_data()
	restart_btn.set_focus_mode(FOCUS_NONE)
