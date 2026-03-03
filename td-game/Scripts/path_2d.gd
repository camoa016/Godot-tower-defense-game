extends Path2D

var timer = 1.5
var cooldown = 1.0

func spawn_enemy():
	var enemy_path = Globals.enemy_path_scene.instantiate()
	add_child(enemy_path)

func _process(delta: float) -> void:
	if cooldown > 0:
		cooldown -= delta
	if cooldown <= 0:
		spawn_enemy()
		cooldown = timer
