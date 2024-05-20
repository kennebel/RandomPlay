extends FlockBase

class_name FishBase

@export var SwimLimit:float = 1
var MoveDir:int = 1
var ModelView:Node3D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	ItemType = RandGlobal.ItemType.Fish
	ModelView = get_node("Model")
	super()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func DoMovement(delta:float):
	super(delta)
	
	# Fish Swimming Motion
	
	ModelView.rotate(Vector3.UP, delta*Speed*-0.25)
