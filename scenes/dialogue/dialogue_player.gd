extends Control

@export_file("*.json") var scene_text_file

var scene_text := {}
var selected_text := []
var in_progress := false

@onready var background := $DialogTexture
@onready var npc_name := $DialogTexture/DialogVerticalContainer/DialogName
@onready var dialogue_text := $DialogTexture/DialogVerticalContainer/RichTextLabel
@onready var dialog_character := $DialogCharacter

func _ready() -> void:
	background.visible = false
	dialog_character.visible = false
	scene_text = load_scene_text()
	SignalDisplayDialogue.connect("display_dialog", Callable(self, "on_display_dialog"))
	
func load_scene_text():
	var file = FileAccess
	if file.file_exists(scene_text_file):
		file.open(scene_text_file, FileAccess.READ)
		return JSON.parse_string(file.get_file_as_string(scene_text_file))
	
func show_dialogue():
	dialogue_text.text = selected_text.pop_front() # Removes and returns the first element of the array fot the text content
	
func next_line():
	if selected_text.size() > 0:
		show_dialogue()
	else:
		finish()
	
func finish():
	npc_name.text = ""
	dialogue_text.text = ""
	dialog_character.visible = false
	background.visible = false
	in_progress = false

func on_display_dialog(title_key, text_key, character_image):
	if in_progress:
		next_line()
	else:
		background.visible = true
		dialog_character.visible = true
		in_progress = true
		dialog_character.texture = load(character_image)
		npc_name.text = scene_text[title_key] # As the title is only one and doe not change, we can just pass the value from the json that IS NOT an array
		selected_text = scene_text[text_key].duplicate()
		show_dialogue()
