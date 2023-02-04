extends baseState


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func process(delta):
	print("entre pa")


func _on_playerDetector_body_entered(body: Node) -> void:
	exit(lsm.seek)
	pass # Replace with function body.


func _on_playerDetector_body_exited(body: Node) -> void:
	exit(lsm.idle)
	pass # Replace with function body.
