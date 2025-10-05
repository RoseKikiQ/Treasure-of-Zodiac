extends Area2D

@export var item_id: String = "KeyC3"

func _ready():
	var scene_name = get_tree().current_scene.name
	if GameState.is_collected(scene_name, item_id):
		queue_free()

func _on_aquarius_key_body_entered(body: Node2D) -> void:
	if body.KeyC3_collected == true:
		var scene_name = get_tree().current_scene.name
		GameState.mark_collected(scene_name, item_id)
		queue_free()
