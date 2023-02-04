extends baseState


func _ready() -> void:
	machine = get_parent()
	

func integrate_forces(_state):
	
	if Input.is_action_pressed("left"):
		owner.linear_velocity.x = lerp(owner.linear_velocity.x, -owner.MAXSPEED, 0.2)
		owner.sprite.set_animation("runL")
		owner.motion = -1
	if Input.is_action_pressed("right"):
		owner.linear_velocity.x = lerp(owner.linear_velocity.x, owner.MAXSPEED, 0.2)
		owner.sprite.set_animation("run")
		owner.motion = 1
		
	if owner.isGrounded and Input.is_action_just_pressed("up"):
		owner.apply_impulse(Vector2.ZERO, Vector2.UP * owner.jumpForce)
		
	if owner.linear_velocity.distance_to(Vector2.ZERO) / owner.MAXSPEED < 0.5 and !(Input.is_action_pressed("left") or Input.is_action_pressed("right")):
		exit(machine.idle)
	

func process(_delta):
	if owner.linear_velocity != Vector2.ZERO:
		owner.sprite.set_speed_scale(owner.linear_velocity.distance_to(Vector2.ZERO) / owner.MAXSPEED)
