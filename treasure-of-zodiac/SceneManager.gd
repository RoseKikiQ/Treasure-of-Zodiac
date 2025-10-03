class_name Scene_Manager extends Node

var player: Node = null
var scene_dir_path := "res://"

func change_scene(from: Node, to_scene_name: String) -> void:
	if has_node("Circle"):
		player = get_node("Circle")

		if player.get_parent():
			player.get_parent().remove_child(player)
		get_tree().get_root().add_child(player)

	var full_path = scene_dir_path + to_scene_name + ".tscn"
	from.get_tree().call_deferred("change_scene_to_file", full_path)

	await get_tree().process_frame
	var new_scene = get_tree().current_scene
	if player and new_scene:
		new_scene.add_child(player)
