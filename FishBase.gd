extends Node3D
var speed: float = 2.0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Here fishy fishy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.z -= delta * speed
