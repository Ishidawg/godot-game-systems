extends Node2D

var count := 0
var direction := 1
var speed := 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if true or false: print("Something")

	while count <= 10:
		print("Counting...", count)
		count += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Icon.position.x += speed * direction

	if $Icon.position.x >= (get_viewport_rect().end.x - ($Icon.texture.get_width() >> 1)):
		direction = - 1

	if $Icon.position.x <= (0 + ($Icon.texture.get_width() >> 1)):
		direction = 1
