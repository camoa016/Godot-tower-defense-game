extends Node2D

@onready var child_node = $Tower
var placing = false
var tile_size = 32

func place_tower():
	var tower = Globals.tower_scene.instantiate()
	add_child(tower)

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	mouse_pos = mouse_pos.snapped(Vector2.ONE * tile_size)
	child_node.global_position = mouse_pos
	
	
