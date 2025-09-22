extends Control

@export_file("*.json") var scene_text_file

var scene_text := {}
var selected_text := []
var in_progress := false

@onready var background := $DialogTexture
@onready var npm_name := $DialogTexture/DialogVerticalContainer/DialogName
@onready var dialogue_text := $DialogTexture/DialogVerticalContainer/RichTextLabel


func _ready() -> void:
	background.visible = false
	scene_text = load_scene_text()
	SignalDisplayDialogue.connect("display_dialog", Callable(self, "on_display_dialog"))

func load_scene_text():
	var file = FileAccess
	if file.file_exists(scene_text_file): # I think it is better than 'if file.file_exists(scene_text_file):'
		file.open(scene_text_file, FileAccess.READ)
		return JSON.parse_string(file.get_file_as_string(scene_text_file))

func show_text():
	dialogue_text.text = selected_text.pop_front() # Removes and returns the first element of the array

func next_line():
	if selected_text.size() > 0:
		show_text()
	else:
		finish()

func finish():
	dialogue_text.text = ""
	background.visible = false
	in_progress = false

func on_display_dialog(text_key):
	if in_progress:
		next_line()
	else:
		background.visible = true
		in_progress = true
		selected_text = scene_text[text_key].duplicate()
		show_text()
