extends Sprite2D

@export var item_id: String = "KeyA1"

var mouse_over: bool = false
var mouse_pos: Vector2 = Vector2.ZERO
var difference: Vector2 = Vector2.ZERO
var dragging: bool = false

func _ready():
	# Restore saved position if exists
	var scene_name = get_tree().current_scene.name
	var state = GameState.get_item_state(scene_name, item_id)
	if state.size() > 0:
		global_position = state["position"]

func _on_aries_drag_mouse_entered() -> void:
	mouse_over = true
	
func _on_aries_drag_mouse_exited() -> void:
	mouse_over = false


func _physics_process(_delta: float) -> void:
	difference = get_global_mouse_position() - mouse_pos

	if Input.is_action_pressed("Click") and mouse_over:
		if difference != Vector2.ZERO:
			global_position += difference
			dragging = true
			_save_state()
	elif dragging and Input.is_action_just_released("Click"):
		dragging = false
		_save_state()

	mouse_pos = get_global_mouse_position()

func _save_state():
	var scene_name = get_tree().current_scene.name
	GameState.set_item_state(scene_name, item_id, global_position)
