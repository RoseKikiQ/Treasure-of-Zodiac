extends Node

var KeyA1_collected = false

func _on_aries_key_hidden(body1: Node2D, body2: Area2D) -> void:
	if body1.name=="Circle":
		if body1.KeyA1_collected == true:
			body2.KeyA1_in_bag = false
			queue_free()
