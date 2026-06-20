extends Node2D

var pos := Vector2(100, 100)
var dir := Vector2.RIGHT
var cd_dir := Vector2(1, 1)
var speed := 100.
var acc := 0.1
var test_array := [1,2,3, "string", true, false, 1.0, 2, [0, 0, 0]]
var test_dict := {'a': 1, 'b': 2, 123: [0, 0, 0], true: 'sus'}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print($Icon.position) # returns a Vector2(x, y)
	$Icon.position = pos

	for i in test_array:
		print(i)

	print("\n\n")

	for i in test_dict:
		print(i)

	for key in test_dict:
		print("Key: ", key, "-> value: ", test_dict[key])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bounces_cd($CD, delta)

	$Icon.position += (dir * speed) * delta

	if $Icon.position.x >= (get_viewport_rect().end.x - ($Icon.texture.get_width() >> 1)):
		dir = Vector2.LEFT

	if $Icon.position.x <= (0 + ($Icon.texture.get_width() >> 1)):
		dir = Vector2.RIGHT

func bounces_cd(cd: Sprite2D, delta: float) -> void:
	var screen_size := Vector2(get_viewport_rect().end.x - (cd.texture.get_width() >> 1), get_viewport_rect().end.y - (cd.texture.get_height() >> 1))

	cd.position += (cd_dir * speed) * delta

	if cd.position.x >= screen_size.x:
		cd_dir.x = -1

	if cd.position.x <= 0 + (cd.texture.get_width() >> 1):
		cd_dir.x = 1

	if cd.position.y >= screen_size.y:
		cd_dir.y = -1

	if cd.position.y <= 0 + (cd.texture.get_height() >> 1):
		cd_dir.y = 1

	speed += 0.5
