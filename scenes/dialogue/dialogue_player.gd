extends Control

@export_file("*.json") var scene_text_file

var scene_text := {}
var selected_text := []
var in_progress := false

@onready var background := $DialogTexture
@onready var npc_name := $DialogTexture/DialogVerticalContainer/DialogName
@onready var dialogue_text := $DialogTexture/DialogVerticalContainer/RichTextLabel
@onready var dialog_character := $DialogCharacter

signal open_dialogue
signal close_dialogue

func _ready() -> void:
	set_dialogue_false()
	scene_text = load_scene_text()
	SignalDisplayDialogue.connect("display_dialog", Callable(self, "on_display_dialog"))

func load_scene_text() -> Dictionary:
	if FileAccess.file_exists(scene_text_file):
		FileAccess.open(scene_text_file, FileAccess.READ)
		return JSON.parse_string(FileAccess.get_file_as_string(scene_text_file))
	else:
		return {Error = ERR_BUG}
	
func show_dialogue() -> void:
	dialogue_text.text = selected_text.pop_front() # Removes and returns the first element of the array fot the text content
	open_dialogue.emit()
	
func next_line() -> void:
	if selected_text.size() > 0:
		show_dialogue()
	else:
		finish()
	
func finish() -> void:
	set_dialogue_false()
	close_dialogue.emit()

func on_display_dialog(title_key, text_key, character_image) -> void:
	if in_progress:
		next_line()
	else:
		set_dialogue_true()
		dialog_character.texture = load(character_image)
		npc_name.text = scene_text[title_key] # As the title is only one and doe not change, we can just pass the value from the json that IS NOT an array
		selected_text = scene_text[text_key].duplicate()
		show_dialogue()

func set_dialogue_false() -> void:
	background.visible = false
	dialog_character.visible = false
	in_progress = false
	npc_name.text = ""
	dialogue_text.text = ""
	
func set_dialogue_true() -> void:
	background.visible = true
	dialog_character.visible = true
	in_progress = true
