extends Node

enum GAME_STATES {
	Playing, 
	Losing,
	Paused}

var actual_game_state : GAME_STATES

var points : int = 0
var high_score : int = 0

var data_path = "user://data.json"

@export var ui_animator : AnimationPlayer
@export var ui_manager : Control

signal lose(to: String)

func _ready() -> void:
	read_data()
	actual_game_state = GAME_STATES.Playing
	lose.connect(_on_lose)

func _process(delta: float) -> void:
	match actual_game_state:
		#Playing
		0:
			if get_tree().paused != false:
				get_tree().paused = false
		#Losing
		1:
			if get_tree().paused != true:
				get_tree().paused = true
		#Paused
		2:
			if get_tree().paused != true:
				get_tree().paused = true

func _input(event: InputEvent) -> void:
	# Este "if" verifica se o input pause foi precionado
	if Input.is_action_just_pressed("Pause"):
		# Este "if" verifica se um animação não está sendo tocada 
		if !ui_animator.is_playing():
			# Esse "if" e "else" determinam para qual estado ele vai
			if actual_game_state == GAME_STATES.Playing:
				go_to_paused()
			elif actual_game_state == GAME_STATES.Paused:
				go_to_playing()
	
	if Input.is_action_just_pressed("ui_accept"):
		points += 1

func save_data() -> void:
	var data := {
		"high_score" : max(points, high_score) }
	
	var archive = FileAccess.open(data_path, FileAccess.WRITE)
	if archive == null:
		printerr("Archive not found")
		return
	
	var json = JSON.stringify(data)
	archive.store_string(json)
	archive.close()

func read_data() -> void:
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
	
	high_score = json["high_score"]

func go_to_playing() -> void:
	ui_animator.play("Pause Down")
	# O "await" é ultilizado aqui para garantir que o menu vai estar invisivel
	await ui_animator.animation_finished
	actual_game_state = GAME_STATES.Playing

func go_to_paused() -> void:
	ui_animator.play("Pause Up")
	actual_game_state = GAME_STATES.Paused

func go_to_losing(to: String) -> void:
	ui_animator.play("Lose Down")
	read_data()
	ui_manager.set_scores_on_labels()
	actual_game_state = GAME_STATES.Losing

func _on_lose(to: String):
	save_data()
	go_to_losing(to)
