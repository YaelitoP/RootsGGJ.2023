extends KinematicBody2D

const MAXSPEED: = 300

onready var sprite: = $ghostSprite
onready var coll: = $coll
onready var attack: = $attackArea/ghostAttack 
onready var area: = $playerDetector
onready var ghostMachine: =$ghostMachine
onready var idle: = $ghostMachine/ghostIdle
onready var seek: = $ghostMachine/ghostSeek
onready var fear: = $ghostMachine/ghostFear
onready var animation: = $ghostAnimation
onready var lightDetector: = $lightDetector

onready var parent: = get_parent()
onready var start_position = global_position
onready var target_position = global_position
onready var scared: bool
onready var direction: Vector2
onready var velocity: Vector2
onready var acceleration_vector: Vector2

onready var TOLERANCE: = 40
onready var ATTACK: = 30
onready var acceleration: = 50
export var spawn: NodePath

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	pass # Replace with function body.

func update_target_position():
	var boundaries = parent.get_boundaries()
	var target_vector = Vector2(rand_range(boundaries[0].x, boundaries[0].y), rand_range(boundaries[1].x, boundaries[1].y))
	target_position = start_position + target_vector

func accelerate_to_point(point):
	direction = global_position.direction_to(point)
