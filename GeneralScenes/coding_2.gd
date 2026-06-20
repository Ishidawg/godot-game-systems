extends Node2D

var go_right := true
var speed := 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print($Sprite2D.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var screen_width = get_viewport_rect().end.x
	var screen_height = get_viewport_rect().end.y

	second_sprite_move(delta, screen_width, screen_height)

	if $Sprite2D.position.x > screen_width - ($Sprite2D.texture.get_width() / 2):
		go_right = false
	elif $Sprite2D.position.x <= 0 + ($Sprite2D.texture.get_width() / 2):
		go_right = true

	if go_right:
		$Sprite2D.position.x += speed * delta
		$Sprite2D.rotate(0.1)
	else:
		$Sprite2D.position.x -= speed * delta
		$Sprite2D.rotate(-0.1)

# Should move topleft to the bottomright and it should scale up while doing that
func second_sprite_move(delta: float, s_w: float, s_h: float) -> void:
	if $Sprite2DD.position.x <= s_w and $Sprite2DD.position.y <= s_h:
		$Sprite2DD.position.x += (speed << 1) * delta
		$Sprite2DD.position.y += speed * delta

		var scale_speed := 0.2
		$Sprite2DD.scale.x += scale_speed * delta
		$Sprite2DD.scale.y += scale_speed * delta
