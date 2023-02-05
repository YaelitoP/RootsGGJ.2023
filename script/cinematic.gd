extends baseState


func _ready() -> void:
	machine = get_parent()
	pass # Replace with function body.



func _on_hurtBox_area_entered(area: Area2D) -> void:
	if area.is_in_group("door"):
		pass
