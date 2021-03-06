extends Node2D

var borders = Rect2(1, 1, 31, 16)

onready var tileMap = $TileMap

func _ready():
	generate_level()
	
func generate_level():
	var walker = Walker.new(Vector2(19, 11), borders)
	var map = walker.walk(200)
	walker.queue_free()
	for location in map:
		tileMap.set_cellv(location, -1)
	tileMap.update_bitmask_region(borders.position, borders.end)