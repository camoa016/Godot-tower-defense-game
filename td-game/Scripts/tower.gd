extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func get_closest_enemy():
	var enemies = get_tree().get_nodes_in_group("Enemies")
	
	var closest_enemy = null
	var closest_distance = INF
	if len(enemies) > 0:
		for enemy in enemies:
			var distance = global_position.distance_to(enemy.global_position)
			
			if distance < closest_distance:
				closest_distance = distance
				closest_enemy = enemy
		
		return closest_enemy.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var target = get_closest_enemy()
	if target:
		look_at(target)
	
