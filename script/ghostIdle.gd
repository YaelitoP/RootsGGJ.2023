extends baseState
 

func _ready() -> void:
	randomize()
	pass # Replace with function body.

func physics_process(delta: float):

	if owner.target_position.distance_to(owner.global_position) > owner.TOLERANCE:
		accelerate_to_point(owner.target_position, owner.acceleration * delta)
	else:
		owner.update_target_position()
	
	owner.move_and_slide(owner.direction * owner.acceleration)

func accelerate_to_point(point, acceleration_scalar):
	owner.direction = owner.global_position.direction_to(point)

