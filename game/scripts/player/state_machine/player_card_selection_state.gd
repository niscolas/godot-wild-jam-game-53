extends Node
class_name PlayerCardSelectionState

export var input_definition: Resource

var _state_machine: PlayerStateMachine
var _player


func enter(state_machine):
	_state_machine = state_machine
	_player = _state_machine.player
	_player.movement.is_movement_enabled = false
	input_definition = _player.input_definition
	print("Card selection begun")


func update(_delta: float):
	handle_input()


func handle_input():
	if Input.is_action_just_pressed(input_definition.right_input):
		_player.card_hand.hover_next()

	elif Input.is_action_just_pressed(input_definition.left_input):
		_player.card_hand.hover_previous()

	elif Input.is_action_just_pressed(input_definition.interact):
		handle_interact_input()


func handle_interact_input():
	var weapon: Weapon = _player.card_hand.select_current_card()
	_player.card_hand.current_card().queue_free()
	_player.weapon_slot_manager.start_weapon_attachment(weapon)
	_player.weapon_slot_manager.attach_to_first_valid_slot()

	_state_machine.change_state(PlayerStateMachine.State.WEAPON_ATTACHMENT)


func exit():
	pass

#func try_buy_card():
#if money >= current_card.price:
#buy_card()

#func buy_card():
#money -= current_card.price
#current_card.weapon = current_weapon
#current_card.queue_free()
#weapon_attachment_state.start()