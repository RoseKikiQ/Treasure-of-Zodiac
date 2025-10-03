class_name Scenetrigger extends Area2D

@export var connect_scene: String

func _on_body_entered(body: Node2D) -> void:
	if body is Circle:
		scene_manager.change_scene(get_owner(),connect_scene)
