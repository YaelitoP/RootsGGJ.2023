extends StateMachine

onready var idle: = "idle"
onready var moving: = "moving"
onready var onAir: = "onAir"
onready var cinematic: = "cinematic"
onready var channeling: = "channeling"




func _ready() -> void:
	pass 


func _physics_process(delta: float) -> void:
	if !owner.isGrounded and state.name != onAir:
		print("aca le mando mechia")
		state.exit(onAir)
	pass

