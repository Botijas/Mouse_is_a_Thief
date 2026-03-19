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
	
	if Input.is_action_just_pressed("Pause"):
		get_tree().paused = !get_tree().paused
		print(get_tree().paused)

func _on_pause_btn_pressed() -> void:
	get_tree().paused = !get_tree().paused
	print(get_tree().paused)
