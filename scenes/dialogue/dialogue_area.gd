extends Area2D

@export var dialog_key := ""
@export var title_key := ""
@export_file("*") var character_image

@onready var interaction_button: TextureRect = $interaction_button
#signal show_interaction_button

var area_active := false

func _input(event):
	if area_active and event.is_action_pressed("accept"):
		SignalDisplayDialogue.emit_signal("display_dialog", title_key, dialog_key, character_image)

func _on_area_entered(area: Area2D) -> void:
	area_active = true
	interaction_button.visible = true
	

func _on_area_exited(area: Area2D) -> void:
	area_active = false
	interaction_button.visible = false
