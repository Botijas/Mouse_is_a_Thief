extends Node

enum GAME_STATES {
	Playing, 
	Losing,
	Paused}

var actual_game_state : GAME_STATES = GAME_STATES.Playing

@export var ui_animator : AnimationPlayer

func _process(delta: float) -> void:
	match actual_game_state:
		#Playing
		0:
			# O "await" é ultilizado aqui para garantir que o menu vai estar invisivel
			await ui_animator.animation_finished
			if get_tree().paused != false:
				get_tree().paused = false
		#Losing
		1:
			pass
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

func go_to_playing() -> void:
	actual_game_state = GAME_STATES.Playing
	ui_animator.play("Pause Down")

func go_to_paused() -> void:
	actual_game_state = GAME_STATES.Paused
	ui_animator.play("Pause Up")
