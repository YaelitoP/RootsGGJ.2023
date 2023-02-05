extends baseState


func _ready() -> void:
	machine = get_parent()
	pass 

func process(delta):
	if owner.motion == 1:
		
		owner.sprite.set_animation("jump")
	elif owner.motion == -1:
		owner.sprite.set_animation("jumpL")

func integrate_forces(_state):
	if owner.isGrounded and !(Input.is_action_pressed("left") or Input.is_action_pressed("right")):
		exit(machine.idle)
	elif owner.isGrounded:
		exit(machine.moving)
	
	if Input.is_action_pressed("left"):
		owner.linear_velocity.x = lerp(owner.linear_velocity.x, -owner.MAXSPEED, 0.2)
		owner.sprite.set_animation("jump")
		
	if Input.is_action_pressed("right"):
		owner.linear_velocity.x = lerp(owner.linear_velocity.x, owner.MAXSPEED, 0.2)
		owner.sprite.set_animation("jumpL")
	
	#if !(Input.is_action_pressed("right") or Input.is_action_pressed("left")):