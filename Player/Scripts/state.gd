class_name State extends Node

## stores a reference to the Player that this state belongs to.
static var player: Player
static var state_machine : PlayerStateMachine


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# What happens when 
func Init() -> void:
	pass

## What happens when the player enters this state?
func Enter() -> void:
	pass

## What happens when the player exits the state?
func Exit() -> void:
	pass

## What happens during the _process Update in this State?
func Process(_delta : float) -> State:
	return null

## What happens during the _physics_process Update in this State?
func Physics(_delta : float) -> State:
	return null

## What happens with input events in this State?
func HandleInputs(_event : InputEvent) -> State:
	return null
