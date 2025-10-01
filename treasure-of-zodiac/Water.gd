extends Area2D

@export var level: int


func _on_body_entered(body) -> void:
	print(get_tree().change_scene_to_file("res://Water.gd"))
	if body.name=="Circle":
		print(level)
		if level == 0:
				get_tree().change_scene_to_file("res://Water.gd")
