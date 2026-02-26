class_name State_Walk extends State

@export var move_speed : float = 100.0

@onready var idle : State = $"../Idle"
@onready var attack: State_Attack = $"../Attack"



## What happens when the player enters this state?
func Enter() -> void:
	player.update_animation( "walk" )
	pass

## What happens when the player exits the state?
func Exit() -> void:
	pass

## What happens during the _process Update in this State?
func Process(_delta : float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.set_direction():
		player.update_animation("walk")
	return null

## What happens with input events in this State?
func HandleInputs(_event : InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
