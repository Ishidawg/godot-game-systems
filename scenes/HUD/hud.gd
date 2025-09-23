extends CanvasLayer

@export var player_object = player.new()
var current_speed = player_object.speed

func _on_dialog_player_open_dialogue() -> void:
	player_object.speed = 0

func _on_dialog_player_close_dialogue() -> void:
	player_object.speed = current_speed
