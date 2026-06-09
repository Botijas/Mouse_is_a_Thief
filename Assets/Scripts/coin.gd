extends Area2D

@onready var coin_sfx: AudioStreamPlayer2D = $"Coin SFX"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_node_or_null("/root/Game Scene").points += 1
		coin_sfx.play()
		visible = false
