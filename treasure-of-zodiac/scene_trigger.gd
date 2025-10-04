class_name Scenetrigger extends Area2D

@export var required_coins: Array = ["KeyA1", "KeyA2", "KeyA3", "KeyB1", "KeyB2", "KeyB3", 
									 "KeyC1", "KeyC2", "KeyC3", "KeyD1", "KeyD2", "KeyD3"]
var is_open: bool = false
@export var connect_scene: String
var scene_folder = "res://"
var All_collected = false

func _on_body_entered(body: Node2D) -> void:
	var scene_name = get_tree().current_scene.name
	if GameState.all_collected(scene_name, required_coins):
		if body.name == "Circle":
			var full_path = scene_folder + connect_scene + ".tscn"
			var scene_tree = get_tree()
			scene_tree.call_deferred("change_scene_to_file", full_path)
		
