extends Control

var game_scene := "res://Assets/Scenes/game_scene.tscn"
var tutorial_scene := "res://Assets/Scenes/tutorial.tscn"

var data_path = "user://data.json"

@export var score: Label

@export var play_btn : BaseButton
@export var tutorial_btn : BaseButton
@export var quit_btn : BaseButton

func _ready() -> void:
	get_tree().paused = false
	
	if not FileAccess.file_exists(data_path):
		printerr("Não Existe Dado aqui")
		return
	
	var archive = FileAccess.open(data_path, FileAccess.READ)
	if archive == null:
		printerr("Archive not found")
		return
	
	var content = archive.get_as_text()
	archive.close()
	
	var json = JSON.parse_string(content)
	if not json:
		printerr("Não foi possível abrir o JSON")
		return
	
	var high_score : int = json["high_score"]
	score.text = str(high_score)

func _on_play_btn_pressed() -> void:
	get_tree().change_scene_to_file(game_scene)

func _on_exit_btn_pressed() -> void:
	get_tree().quit()

func _on_tutorial_btn_pressed() -> void:
	get_tree().change_scene_to_file(tutorial_scene)
