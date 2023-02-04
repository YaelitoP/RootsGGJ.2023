extends baseState


func _ready() -> void:
	pass 

func integrate_forces(_state):
	if owner.isGrounded and !(Input.is_action_pressed("left") or Input.is_action_pressed("right")):
		print("no me llaman")
		exit(lsm.idle)
	elif owner.isGrounded:
		print("esto se llama?")
		exit(lsm.moving)
	
	if Input.is_action_pressed("left"):
		owner.linear_velocity.x = lerp(owner.linear_velocity.x, -owner.MAXSPEED, 0.2)
		
	if Input.is_action_pressed("right"):
		owner.linear_velocity.x = lerp(owner.linear_velocity.x, owner.MAXSPEED, 0.2)
		
