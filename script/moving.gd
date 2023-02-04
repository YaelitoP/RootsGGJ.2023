extends baseState


func _ready() -> void:
	pass
	
func integrate_forces(_state):
	if Input.is_action_pressed("left"):
		owner.linear_velocity.x = lerp(owner.linear_velocity.x, -owner.MAXSPEED, 0.2)
		owner.sprite.set_flip_h(true)
		owner.sprite.set_animation("run")
		
	if Input.is_action_pressed("right"):
		owner.linear_velocity.x = lerp(owner.linear_velocity.x, owner.MAXSPEED, 0.2)
		owner.sprite.set_flip_h(false)
		owner.sprite.set_animation("run")
		
	if owner.linear_velocity.distance_to(Vector2.ZERO) / owner.MAXSPEED < 0.5 and !(Input.is_action_pressed("left") or Input.is_action_pressed("right")):
		exit(lsm.idle)
	
	
func process(_delta):
	if owner.linear_velocity != Vector2.ZERO:
		owner.sprite.set_speed_scale(owner.linear_velocity.distance_to(Vector2.ZERO) / owner.MAXSPEED)
		print(owner.sprite.speed_scale)
