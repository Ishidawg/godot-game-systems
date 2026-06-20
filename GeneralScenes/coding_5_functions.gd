extends Node2D

var global = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var local = 'out of scope of the test_f'
	print(local)
	test_f(1, 'bct')

	if global:
		print('global var')

	print(calc(2, 2, 'sum'))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func test_f(p_one: int, p_two: String):
	var local = 'local var'
	print(local)
	print(p_one, ' ', p_two)


func calc(a: int, b: int, type: String) -> int:
	match type:
		'sum': return a + b
		'min': return a - b
		_: return 0
