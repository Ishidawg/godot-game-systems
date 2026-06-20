extends Node2D

var go_right := true
var speed := 300
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print($Sprite2D.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var screen_width = get_viewport_rect().end.x

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
