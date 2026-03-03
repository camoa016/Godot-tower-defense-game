extends Node2D

var preview_tower: Node2D
var tile_size := 32
var mouse_pos := Vector2()

func _ready():
	start_placing()

func start_placing():
	preview_tower = Globals.tower_scene.instantiate()
	add_child(preview_tower)

func _process(delta):
	if preview_tower:
		mouse_pos = get_global_mouse_position()
		mouse_pos = mouse_pos.snapped(Vector2.ONE * tile_size)
		preview_tower.global_position = mouse_pos

func is_tile_occupied(position: Vector2) -> bool:
	for child in get_children():
		if child != preview_tower and child.global_position == position:
			print("true")
			return true
	print("false")
	return false
	
func _input(event):
	if event.is_action_pressed("LeftClick"):
		if preview_tower and !is_tile_occupied(mouse_pos):
			preview_tower = null
			start_placing()
		print(get_child_count())
