extends StateMachine

onready var idle: = "idle"
onready var moving: = "moving"
onready var onAir: = "onAir"
onready var cinematic: = "cinematic"
onready var using: = "using"




func _ready() -> void:
	pass 


func _physics_process(_delta: float) -> void:
	if !owner.isGrounded and state.name != onAir:
		state.exit(onAir)
	if (Input.is_action_just_pressed("equipR") or Input.is_action_just_pressed("equipL")) and owner.equipments.size() > 0:
		state.exit(using)

