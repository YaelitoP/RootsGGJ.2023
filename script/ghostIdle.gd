extends baseState
 

func _ready() -> void:
	machine = get_parent()
	randomize()
	pass # Replace with function body.

func physics_process(_delta: float):
	if owner.direction.x > 0:
		owner.sprite.flip_h = true
	if owner.direction.x < 0:
		owner.sprite.flip_h = false
		
	if owner.target_position.distance_to(owner.global_position) > owner.TOLERANCE:
		owner.accelerate_to_point(owner.target_position)
	else:
		owner.update_target_position()
	
	owner.move_and_slide(owner.direction * owner.acceleration)
	
func enter():
	owner.sprite.set_animation("idle")
