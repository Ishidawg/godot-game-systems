extends Control
class_name DialogScreen

var _step := 0.05
var _id := 0
var data := {}

@export_category("Objects")
@export var _name: Label = null
@export var _dialog: RichTextLabel = null
@export var _character: TextureRect = null

func _ready() -> void:
	_initialize_dialog()
	
func _process(delta: float) -> void:
	# Speed dialog when keeps pressing Enter
	if Input.is_action_pressed("ui_accept") and _dialog.visible_characters < 1: # Enter
		_step = 0.01
		return
	
	_step = 0.05
	if Input.is_action_just_pressed("ui_accept"):
		_id += 1
		
		if _id == data.size(): # Means that the dialog already ends
			queue_free()
			return
		
		_initialize_dialog()
	
func _initialize_dialog() -> void:
	_name.text = data[_id]["title"]
	_dialog.text = data[_id]["dialog"]
	_character.texture = load(data[_id]["character"])
	
	_dialog.visible_characters = 0
	while _dialog.visible_ratio < 1: # 1 it's 100%, means that the full text it's already complete
		await  get_tree().create_timer(_step).timeout # this is a time to wait the _step variable ends 
		_dialog.visible_characters += 1
	
