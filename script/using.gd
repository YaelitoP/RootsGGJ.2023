extends baseState

enum allEquipments {
	LANTERN,
	HOE,
	GLASSES
}
onready var equiped: int = 0
onready var currAngle: int

func _ready() -> void:
	machine = get_parent()
	pass 

func integrate_forces(_state):
	if Input.is_action_pressed("left"):
		owner.linear_velocity.x = lerp(owner.linear_velocity.x, -owner.speed, 0.2)
		owner.motion = -1
		
	if Input.is_action_pressed("right"):
		owner.linear_velocity.x = lerp(owner.linear_velocity.x, owner.speed, 0.2)
		owner.motion = 1
	
	
	
func physics_process(_delta: float):
	if !owner.hurted:
		if Input.is_action_just_pressed("equipL"):
			equiped = (equiped - 1) % owner.equipments.size()
			
			if equiped == allEquipments.LANTERN and owner.motion == 1:
				owner.sprite.set_animation("lanternEquip")
			if equiped == allEquipments.LANTERN and owner.motion == -1:
				owner.sprite.set_animation("lanternEquipL")
				
		if Input.is_action_just_pressed("equipR"):
			equiped = (equiped + 1) % owner.equipments.size()
			
			if equiped == allEquipments.LANTERN and owner.motion == 1:
				owner.sprite.set_animation("lanternEquip")
			if equiped == allEquipments.LANTERN and owner.motion == -1:
				owner.sprite.set_animation("lanternEquipL")
				
		if Input.is_action_just_pressed("unequip"):
			exit(machine.idle)
		
		currAngle = int(owner.light.rotation_degrees) % 360
		match equiped:
			
			allEquipments.LANTERN:
				if Input.is_action_pressed("interact"):
					owner.collLight.set_polygon([
						Vector2(8, -8), 
						Vector2(72, -24),
						Vector2(72, 24),
						Vector2(8, 8)
					])
					owner.light.look_at(owner.get_mousePo())
					if (currAngle > -30 and currAngle < 0) or (currAngle > 330 and currAngle < 360):
						owner.sprite.set_animation("lanternR")
					if (currAngle > -60 and currAngle < -30) or (currAngle > 300 and currAngle < 330):
						owner.sprite.set_animation("lanternDiagUp")
					if (currAngle > -90 and currAngle < -60) or (currAngle > 270 and currAngle < 300):
						owner.sprite.set_animation("lanternUp")
					if (currAngle > -120 and currAngle < -90) or (currAngle > 240 and currAngle < 270):
						owner.sprite.set_animation("lanternUpL")
					if (currAngle > -150 and currAngle < -120) or (currAngle > 210 and currAngle < 240):
						owner.sprite.set_animation("lanternDiagUpL")
					if (currAngle > -190 and currAngle < -150) or (currAngle > 170 and currAngle < 210):
						owner.sprite.set_animation("lanternL")
					if (currAngle > -280 and currAngle < -190) or (currAngle > 80 and currAngle < 170):
						owner.sprite.set_animation("lanternDiagDownL")
					if (currAngle > -360 and currAngle < -280) or (currAngle > 0 and currAngle < 80):
						owner.sprite.set_animation("lanternDiagDown")
				
				if Input.is_action_just_released("interact"):
					owner.collLight.set_polygon([])
					pass
				
			allEquipments.HOE:
				continue
			allEquipments.GLASSES:
				continue
				
			
