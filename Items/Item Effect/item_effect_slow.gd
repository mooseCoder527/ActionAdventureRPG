class_name ItemEffectSlow extends ItemEffect

@export var slow_duration : float = 1.0
@export var slow_factor : float = 50.0
var used : bool = false
@export var sound : AudioStream

func use() -> void:
	if used == false:
		var old_speed = PlayerManager.player.walk.move_speed
	
		PlayerManager.player.walk.timer.wait_time = slow_duration
		PlayerManager.player.walk.move_speed /= slow_factor
		PauseMenu.play_sound( sound )
		used = true
		PlayerManager.player.walk.timer.start()
		await PlayerManager.player.walk.timer.timeout
		PlayerManager.player.walk.move_speed = old_speed
		used = false
	
