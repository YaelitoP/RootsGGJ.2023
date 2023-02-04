extends RigidBody2D

onready var playerMachine: = $states
onready var idle: = $states/idle
onready var moving: = $states/moving
onready var onAir: = $states/onAir
onready var cinematic: = $states/cinematic
onready var channeling: = $states/channeling

const MAX_SPEED: = 150


var speed: = 100
var motion: int
var isGrounded: bool



func _ready() -> void:
	pass

