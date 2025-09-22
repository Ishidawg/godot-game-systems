extends Area2D

@export var dialog_key := ""
@export var title_key := ""
var area_active := false

func _input(event):
	if area_active and event.is_action_pressed("accept"):
		SignalDisplayDialogue.emit_signal("display_dialog", title_key, dialog_key)
		print("clicou")


func _on_area_entered(area: Area2D) -> void:
	area_active = true
	print("entro nessa bct")
	

func _on_area_exited(area: Area2D) -> void:
	area_active = false
