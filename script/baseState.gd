extends Node
class_name baseState

onready var lsm: StateMachine

func enter():
	print(lsm.state.name)
	pass

func exit(next_state):
	print(lsm, "exit ", next_state)
	
	lsm.change_to(next_state)

####################################################
### Optional handler functions for game loop events.
### Delete the ones that you don't need.
####################################################

func process(_delta):
	# Replace pass with your handler code
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
