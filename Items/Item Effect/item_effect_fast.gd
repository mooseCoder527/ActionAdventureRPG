class_name ItemEffectFast extends ItemEffect

@export var fast_duration : float = 1.0
@export var fast_factor : float = 50.0
@export var sound : AudioStream

func use() -> void:
	var old_speed = PlayerManager.player.walk.move_speed
	PlayerManager.player.walk.timer.wait_time = fast_duration
	PlayerManager.player.walk.move_speed *= fast_factor
	PlayerManager.player.walk.timer.start()
	PauseMenu.play_sound( sound )
	await PlayerManager.player.walk.timer.timeout
	PlayerManager.player.walk.move_speed = old_speed
