extends Control

@onready var fade: CanvasLayer = $Fade

var game_scene := "res://Assets/Scenes/game_scene.tscn"
var tutorial_scene := "res://Assets/Scenes/tutorial.tscn"
var credits_scene := "res://Assets/Scenes/credits_menu.tscn"

var data_path = "user://data.json"

@onready var menu_music: AudioStreamPlayer = $"Menu Music"

@export var score : Label

@export var play_btn : BaseButton
@export var tutorial_btn : BaseButton
@export var quit_btn : BaseButton

@export var confirm_sfx: AudioStreamPlayer
@export var click_sfx: AudioStreamPlayer

@onready var menu: MarginContainer = $Menu
@onready var tutorial: Control = $Tutorial
@onready var credits: Control = $"Credits Menu"

func _ready() -> void:
	menu_music.play(1.0)
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

func _process(delta: float) -> void:
	pass

func _on_play_btn_pressed() -> void:
	menu_music.playing = false
	confirm_sfx.play()
	await fade.fade(1.0, 0.7).finished
	get_tree().change_scene_to_file(game_scene)

func _on_exit_btn_pressed() -> void:
	get_tree().quit()

func _on_tutorial_btn_pressed() -> void:
	click_sfx.play()
	await click_sfx.finished
	menu.visible = false
	tutorial.visible = true

func _on_credits_btn_pressed() -> void:
	click_sfx.play()
	await click_sfx.finished
	menu.visible = false
	credits.visible = true
