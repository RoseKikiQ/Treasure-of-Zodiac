extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name=="Circle":
		body.KeyA1_collected = true
		queue_free()
