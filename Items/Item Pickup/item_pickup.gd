@tool

class_name ItemPickup extends Node

@export var item_data : ItemData : set = _set_item_data

@onready var area: Area2D = $Area2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready() -> void:
	_update_texture()
	if Engine.is_editor_hint():
		return
	area.body_entered.connect( _on_body_entered )

func _on_body_entered( b ) -> void:
	if b is Player:
		if item_data:
			if PlayerManager.INVENTORY_DATA.add_item( item_data ) == true:
				_item_picked_up()
	pass


func _item_picked_up() -> void:
	area.body_entered.disconnect( _on_body_entered )
	audio_stream_player.play()
	self.visible = false
	await audio_stream_player.finished
	queue_free()
	pass


func _set_item_data( id : ItemData) -> void:
	item_data = id
	_update_texture()
	pass


func _update_texture() -> void:
	if item_data and sprite:
		sprite.texture = item_data.texture
	pass
