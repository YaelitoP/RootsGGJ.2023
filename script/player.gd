extends RigidBody2D

class_name Player


onready var sprite: = $playerSprite
onready var playerMachine: = $states
onready var idle: = $states/idle
onready var moving: = $states/moving
onready var onAir: = $states/onAir
onready var cinematic: = $states/cinematic
onready var channeling: = $states/channeling

const MAXSPEED: = 300


var speed: = 100
var motion: int
var isGrounded: bool



func _ready() -> void:
	sprite.set_playing(true)
	

func _integrate_forces(physicsState: Physics2DDirectBodyState) -> void:
	if playerMachine.state.has_method("integrate_forces"):
		playerMachine.state.integrate_forces(physicsState)
	
