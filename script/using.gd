extends baseState

enum allEquipments {
	LANTERN,
	HOE,
	GLASSES
}
onready var equiped: int = 0

func _ready() -> void:
	machine = get_parent()
	pass 

func integrate_forces(_state):
	if Input.is_action_pressed("left"):
		owner.linear_velocity.x = lerp(owner.linear_velocity.x, -owner.speed, 0.2)
		owner.sprite.set_animation("runL")
		owner.motion = -1
		
	if Input.is_action_pressed("right"):
		owner.linear_velocity.x = lerp(owner.linear_velocity.x, owner.speed, 0.2)
		owner.sprite.set_animation("run")
		owner.motion = 1

	
	
	
func physics_process(delta: float):
	if Input.is_action_just_pressed("equipL"):
		equiped = (equiped - 1) % owner.equipments.size()
	if Input.is_action_just_pressed("equipR"):
		equiped = (equiped + 1) % owner.equipments.size()
	if Input.is_action_just_pressed("unequip"):
		exit(machine.idle)
	
	match equiped:
		allEquipments.LANTERN:
			if Input.is_action_pressed("interact"):
				owner.light.look_at(owner.get_mousePo())
				print(owner.light.rotation," ", owner.light.get_angle_to(owner.get_mousePo()))
		allEquipments.HOE:
			continue
		allEquipments.GLASSES:
			continue
			
		
	if owner.motion == -1:
		if equiped == allEquipments.LANTERN:
			owner.sprite.set_animation("lantern")
	if owner.motion == 1:
		if equiped == allEquipments.LANTERN:
			owner.sprite.set_animation("lanternL")
