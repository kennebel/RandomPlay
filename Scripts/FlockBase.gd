extends Node3D
class_name FlockBase

var ID: int = -1
@export var ItemType: RandGlobal.ItemType = RandGlobal.ItemType.None
@export var Speed: float = 2.0
@export var Energetic: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	ID = RGlobal.GetNextID()
	RGlobal.RegisterItem(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
