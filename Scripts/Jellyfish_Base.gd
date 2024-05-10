extends Node3D
@export var speed: float = 0.5
@export var limit: float = 1
var startY: float = 0
var moveDir: int = 1
var driftAway: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Jelly man!")
	startY = position.y
	driftAway.x = position.x
	driftAway.y = position.z
	driftAway = driftAway.normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y > (startY+limit) || position.y < (startY-limit):
		moveDir *= -1
	position.y += delta * speed * moveDir
	position.x += driftAway.x * delta * (speed)
	position.z += driftAway.y * delta * (speed)
