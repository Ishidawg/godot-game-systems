extends Node2D

var a := 10.
var b := 20.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_shit()
	print("C values:", pythagoras(a, b))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func print_shit() -> void:
	print("something")
	print(123)

func pythagoras(p_a: float, p_b: float ) -> float:
	return sqrt(p_a**2 + p_b**2) # Instead of using sqrt, I also can do: value ** 0.5
