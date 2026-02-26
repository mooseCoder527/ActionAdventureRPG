class_name State_Idle extends State

@onready var walk: State = $"../Walk"
@onready var attack: State = $"../Attack"

## What happens when the player enters this state?
func Enter() -> void:
	player.update_animation( "idle" )
	pass

## What happens when the player exits the state?
func Exit() -> void:
	pass

## What happens during the _process Update in this State?
func Process( _delta : float ) -> State:
	
	if player.direction != Vector2.ZERO:
		return walk
	
	player.velocity = Vector2.ZERO
	return null

## What happens during the _physics_process Update in this State?
func Physics(_delta : float) -> State:
	return null

## What happens with input events in this State?
func HandleInputs(_event : InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
