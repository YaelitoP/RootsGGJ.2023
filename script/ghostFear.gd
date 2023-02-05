extends baseState

onready var target: Object
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	machine = get_parent()
	pass # Replace with function body.


func physics_process(_delta: float):
	if owner.direction.x > 0:
		owner.sprite.flip_h = true
	if owner.direction.x < 0:
		owner.sprite.flip_h = false
		
	if owner.scared:
		owner.target_position = target.global_position
	else:
		for bodies in owner.area.get_overlapping_bodies():
			print("aca entra un body ", bodies.name)
			if bodies.is_in_group("player"):
				exit(machine.seek)
	if owner.target_position.distance_to(owner.global_position) > owner.TOLERANCE:
		owner.accelerate_to_point(owner.target_position)
	
	owner.move_and_slide(-owner.direction * owner.acceleration)
	

func _on_lightDetector_area_entered(area: Area2D):
	if area.is_in_group("light"):
		owner.scared = true
		target = area
		exit(machine.fear)


func _on_lightDetector_area_exited(area: Area2D) -> void:
	if area.is_in_group("light"):
		yield(get_tree().create_timer(1.0), "timeout")
		owner.scared = false
		
	pass # Replace with function body.
