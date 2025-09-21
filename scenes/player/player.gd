extends CharacterBody2D

const SPEED := 420.0
@onready var player_sprites: AnimatedSprite2D = %player_sprites

func _process(delta: float) -> void:
	player_movement(delta)
		
	move_and_slide()
	
func player_movement(delta: float) -> void:
	var direction := Vector2.ZERO
	
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")

	velocity = direction.normalized() * SPEED
	
	print(direction)

	if velocity != Vector2.ZERO:
		player_sprites.play("run")
	else:
		player_sprites.play("idle")
		
	if direction.x == -1:
		player_sprites.flip_h = true
	
	if direction.x == 1:
		player_sprites.flip_h = false
