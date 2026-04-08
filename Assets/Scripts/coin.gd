extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_node_or_null("/root/Game Scene").points += 1
		visible = false
