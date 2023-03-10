extends Node2D
class_name Player

export var speed: float = 500.0
export var input_definition: Resource

export var _card_hand_path: NodePath = "card_hand"
export var _movement_path: NodePath = "player_body"
export var _weapon_user_path: NodePath
export var _weapon_slot_manager_path: NodePath = "player_body/weapon_slots"
export var _state_machine_path: NodePath = "state_machine"
export var _currency_agent_path: NodePath = "currency_agent"
export var _health_agent_path: NodePath = "health_agent"
export var _points_agent_path: NodePath = "points_agent"
export var _weapon_slot_count: int
export var health_changed_event: Resource
export var currency_changed_event: Resource
export var points_changed_event: Resource
export var died_event: Resource
export var other_player_died_event: Resource

onready var weapon_slot_manager = get_node(_weapon_slot_manager_path)
onready var weapon_user: WeaponUser = get_node(_weapon_user_path)
onready var card_hand = get_node(_card_hand_path)
onready var points_agent = get_node(_points_agent_path)
onready var movement = get_node(_movement_path)
onready var _state_machine = get_node(_state_machine_path)
onready var currency_agent = get_node(_currency_agent_path)
onready var health_agent = get_node(_health_agent_path)

var manager

func setup(p_manager):
	manager = p_manager
	movement.setup(self)
	_state_machine.setup()
	weapon_slot_manager.instantiate_weapon_slots()
	health_agent.setup(self)
	currency_agent.setup(self)
	card_hand.setup(self)
	points_agent.setup(self)
