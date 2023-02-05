extends baseState

onready var target: Object
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	machine = get_parent()
	

func physics_process(_delta: float) -> void:
	owner.target_position = target.global_position
	
	if owner.direction.x > 0:
		owner.sprite.flip_h = true
	if owner.direction.x < 0:
		owner.sprite.flip_h = false	
	
	if owner.target_position.distance_to(owner.global_position) < owner.ATTACK:
		owner.sprite.set_animation("atk")
	owner.accelerate_to_point(owner.target_position)	
	owner.move_and_slide(owner.direction * owner.acceleration)
	

func _on_playerDetector_body_entered(body: Node) -> void:
	exit(machine.seek)
	target = body

func _on_playerDetector_body_exited(_body: Node) -> void:
	exit(machine.idle)
	
