extends Node
var collected_items: Dictionary = {}

func mark_collected(scene_name: String, item_id: String) -> void:
	if not collected_items.has(scene_name):
		collected_items[scene_name] = []
	if item_id not in collected_items[scene_name]:
		collected_items[scene_name].append(item_id)

func is_collected(scene_name: String, item_id: String) -> bool:
	return collected_items.has(scene_name) and item_id in collected_items[scene_name]
