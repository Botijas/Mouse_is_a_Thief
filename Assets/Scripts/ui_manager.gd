extends Control

var main_menu_scene := "res://Assets/Scenes/main_menu.tscn"

@export_category("Scenes Refs")
@export var game_scene : Node
@export_category("Buttons Refs")
@export var pause_btn : BaseButton
@export var resume_btn : BaseButton
@export var back_btn : BaseButton
@export var quit_btn : BaseButton
@export var restart_btn : BaseButton
@export var return_btn : BaseButton
@export_category("Label Refs")
@export var score : Label
@export var last_score : Label
@export var high_score : Label
@export var lose_reason : Label

@onready var confirm_sfx: AudioStreamPlayer = $ConfirmSFX
@onready var click_sfx: AudioStreamPlayer = $ClickSFX
@onready var return_sfx: AudioStreamPlayer = $ReturnSFX

func _physics_process(delta: float) -> void:
	score.text = str(game_scene.points)

func set_scores_on_labels() -> void:
	last_score.text = str(game_scene.points)
	high_score.text = str(game_scene.high_score)

func set_lose_reason(to : String):
	match to:
		"wait_time":
			lose_reason.text = "The rat ate the cheese"
		"civil":
			lose_reason.text = "The rat was caught."

func _on_pause_btn_pressed() -> void:
	click_sfx.play()
	game_scene.go_to_paused()

func _on_resume_btn_pressed() -> void:
	click_sfx.play()
	game_scene.go_to_playing()

func _on_back_btn_pressed() -> void:
	return_sfx.play()
	await return_sfx.finished
	get_tree().change_scene_to_file(main_menu_scene)

func _on_quit_btn_pressed() -> void:
	get_tree().quit()

func _on_restart_btn_pressed() -> void:
	confirm_sfx.play()
	await confirm_sfx.finished
	game_scene.read_data()
	get_tree().reload_current_scene()

func _on_return_btn_pressed() -> void:
	return_sfx.play()
	await return_sfx.finished
	get_tree().change_scene_to_file(main_menu_scene)
