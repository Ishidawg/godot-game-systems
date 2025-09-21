extends Node2D
class_name LevelOne

const _DIALOG_SCREEN: PackedScene = preload("res://scenes/dialog/dialog_screen.tscn")

var _red_lancer_dialog_data := {
	0: {
		"character": "res://assets/DialogCharacters/Red_Lancer.png",
		"dialog": "Welcome to Floating Islands - ya I know it is not actually floating the skyes, but take look: skyes and water here it's same color haha!",
		"title": "Crestfallen Lancer"
	},
	1: {
		"character": "res://assets/DialogCharacters/Red_Lancer_2.png",
		"dialog": "Well, this is a test demo of what this world could be, this is my destiny... be an npc that only test this sweet dialog box...",
		"title": "Crestfallen Lancer"
	},
	2: {
		"character": "res://assets/DialogCharacters/Red_Lancer.png",
		"dialog": "And I'll be forever serving this only porpuse...",
		"title": "Crestfallen Lancer"
	},
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"): # Space
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _red_lancer_dialog_data
		_hud.add_child(_new_dialog)
