extends CharacterBody2D
@export var is_final = false
var triggered = false

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("left", "right", "up", "down")
	if not triggered:
		velocity = input_dir * 500
	else:
		velocity = Vector2(0,0)
	if is_final:
		velocity.y = 0
	move_and_slide()
