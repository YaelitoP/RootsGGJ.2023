extends RigidBody2D

class_name Player

onready var coll: = $coll
onready var ray: = $floorRay
onready var sprite: = $playerSprite
onready var playerMachine: = $states
onready var idle: = $states/idle
onready var moving: = $states/moving
onready var onAir: = $states/onAir
onready var cinematic: = $states/cinematic
onready var channeling: = $states/channeling

const MAXSPEED: = 300

var jumpForce: = 900
var speed: = 100
var motion: int = 1
var isGrounded: bool



func _ready() -> void:
	sprite.set_playing(true)

func _physics_process(_delta: float) -> void:
	
	if ray.is_colliding():
		isGrounded = true
	else:
		isGrounded = false
		#yield(get_tree().create_timer(1.0),"timeout")

func _integrate_forces(physicsState: Physics2DDirectBodyState) -> void:
	if playerMachine.state.has_method("integrate_forces"):
		playerMachine.state.integrate_forces(physicsState)
	
