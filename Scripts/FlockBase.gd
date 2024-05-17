extends Node3D
class_name FlockBase

# Variables
# Editor Variables
@export var ItemType: RandGlobal.ItemType = RandGlobal.ItemType.None
@export var Speed: float = 2.0
@export var Energetic: float = 1.0

# Local Variables
var ID: int = -1

# Overridden Node3D functions
func _ready():
	ID = RGlobal.GetNextID()
	RGlobal.RegisterItem(self)

func _exit_tree():
	RGlobal.UnregisterItem(self)

func _process(delta):
	self.rotate(Vector3.UP, delta*Speed*-0.25)
	self.translate_object_local(Vector3.FORWARD * delta * Speed)

# User functions
func FindPeers():
	pass
