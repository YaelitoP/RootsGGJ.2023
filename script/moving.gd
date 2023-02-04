extends baseState


func _ready() -> void:
	pass
	

func physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("left"):
		
		owner.add_central_force(Vector2(-owner.speed, 0))
		print(owner.linear_velocity)
	if Input.is_action_pressed("right"):
		print(owner.linear_velocity)
		owner.add_central_force(Vector2(owner.speed, 0))
		
	if owner.get_linear_velocity() == Vector2.ZERO:
		lsm.change_to(lsm.idle)
 
