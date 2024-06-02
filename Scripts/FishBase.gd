extends FlockBase

class_name FishBase

@export var SwimLimit:float = 0.25
var MoveDir:int = 1
var ModelView:Node3D = null

var time_out:float = 1.0
var time_since:float = 0.0
var format_NameNum:String = "%s: %5.5f"

func _ready():
	ModelView = get_node("Model")
	ModelView.rotation.y = randf_range((SwimLimit * -1), SwimLimit)
	super()


func DoMovement(delta:float):
	super(delta)
	
	# Fish Swimming Motion
	ModelView.rotate(Vector3.UP, delta*Speed*-0.25*MoveDir)
	if ModelView.rotation.y > SwimLimit:
		MoveDir = 1
	elif ModelView.rotation.y < (SwimLimit * -1):
		MoveDir = -1
	
	"""
	time_since += delta
	if time_since > time_out:
		print(format_NameNum % [name, ModelView.rotation.y])
		time_since = 0.0
	"""
