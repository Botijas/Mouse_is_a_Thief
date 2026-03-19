extends Node

enum GAME_STATES {
	Playing, 
	Losing,
	Paused
}

var actual_game_state : GAME_STATES = 0

func _process(delta: float) -> void:
	match actual_game_state:
		#Playing
		0:
			pass
		#Losing
		1:
			pass
		#Paused
		2:
			pass
		

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Pause"):
		pause_btn()

func pause_btn() -> void:
	get_tree().paused = !get_tree().paused
	print(get_tree().paused)
	if get_tree().paused:
		actual_game_state = GAME_STATES.Paused
	else:
		actual_game_state = GAME_STATES.Playing
	
	
