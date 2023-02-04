extends baseState



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	machine = get_parent()
	pass # Replace with function body.

func physics_process(_delta: float) -> void:
	if owner.motion == 1:
		owner.sprite.set_animation("idle")
	if owner.motion == -1:
		owner.sprite.set_animation("idleL")
	owner.linear_velocity.x = lerp(owner.linear_velocity.x, 0, 0.5)
	if Input.is_action_pressed("left"):
		
		owner.apply_impulse(Vector2.ZERO, Vector2(-owner.speed, 0))
		exit(machine.moving)
		
	if Input.is_action_pressed("right"):
		owner.apply_impulse(Vector2.ZERO, Vector2(owner.speed, 0))
		exit(machine.moving)
		
	if owner.isGrounded and Input.is_action_just_pressed("up"):
		owner.apply_impulse(Vector2.ZERO, Vector2.UP * owner.jumpForce)
		exit(machine.onAir)
		
