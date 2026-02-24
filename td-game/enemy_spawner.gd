extends Node2D

var timer = 1.0
var cooldown = 1.0

func spawn_enemy():
	var enemy = Globals.enemy_scene.instantiate()
	
	
	
func _process(delta: float) -> void:
	if cooldown > 0:
		cooldown -= delta
		if cooldown <= 0:
			spawn_enemy()
			cooldown = timer
