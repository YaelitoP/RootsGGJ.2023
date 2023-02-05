extends StateMachine

onready var idle: = "idle"
onready var moving: = "moving"
onready var onAir: = "onAir"
onready var cinematic: = "cinematic"
onready var using: = "using"


onready var knockback: Vector2
onready var knockbackX: int

func _ready() -> void:
	pass 


func _physics_process(delta: float) -> void:
			
	if owner.timer.get_time_left() == 0 and owner.hurted:
		owner.hurted = false
	
	if !owner.isGrounded and state.name != onAir:
		state.exit(onAir)
	if (Input.is_action_just_pressed("equipR") or Input.is_action_just_pressed("equipL")) and owner.equipments.size() > 0:
		state.exit(using)



func _on_hurtBox_area_entered(area: Area2D) -> void:
	if area.is_in_group("atacks") and !owner.hurted:
			knockbackX = (owner.global_position.x - area.owner.global_position.x)
			if knockbackX > 0:
				knockback = Vector2(1, 0)
			else:
				knockback = Vector2(-1, 0)
			owner.apply_impulse(Vector2.ZERO, knockback * (owner.jumpForce * 3))
			owner.hurted = true
			print(knockback * (owner.jumpForce * 3))
			owner.timer.start()
	pass # Replace with function body.
