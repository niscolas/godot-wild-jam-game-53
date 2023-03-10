extends Node
class_name PlayerFightingState

var _player
var _state_machine: PlayerStateMachine


func enter(owner):
	_state_machine = owner
	_player = _state_machine.player
	_player.movement.is_movement_enabled = true
	print("Fighting - Enter")


func update(delta: float):
	pass


func physics_update(delta: float):
	_player.weapon_user.custom_update(delta)


func exit():
	print("Fighting - Exit")
