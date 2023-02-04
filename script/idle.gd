extends baseState



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func physics_process(_delta: float) -> void:
	owner.sprite.set_animation("idle")
	owner.linear_velocity.x = lerp(owner.linear_velocity.x, 0, 0.5)
	if Input.is_action_just_pressed("left"):
		
		owner.apply_impulse(Vector2.ZERO, Vector2(-owner.speed, 0))
		exit(lsm.moving)
		
	if Input.is_action_just_pressed("right"):
		owner.apply_impulse(Vector2.ZERO, Vector2(owner.speed, 0))
		exit(lsm.moving)
		
