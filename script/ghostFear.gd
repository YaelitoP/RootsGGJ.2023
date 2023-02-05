extends baseState

onready var target: Object
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	machine = get_parent()
	pass # Replace with function body.


func physics_process(_delta: float):
		
	if owner.scared:
		owner.target_position = target.global_position
		
	if owner.target_position.distance_to(owner.global_position) > owner.TOLERANCE:
		owner.accelerate_to_point(owner.target_position)
		
	owner.move_and_slide(-owner.direction * owner.acceleration)
	

func _on_lightDetector_area_entered(area: Area2D):
	if area.is_in_group("light"):
		owner.scared = true
		target = area
		exit(machine.fear)
