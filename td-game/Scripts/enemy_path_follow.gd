extends PathFollow2D

# Speed in percentage of path per second (0.0 to 1.0)
@export var speed_ratio = 0.1

func _ready() -> void:
	var enemy = Globals.enemy_scene.instantiate()
	add_child(enemy)

func _physics_process(delta):
	progress_ratio += speed_ratio * delta

	if(progress_ratio >= 1.0):
		queue_free()
