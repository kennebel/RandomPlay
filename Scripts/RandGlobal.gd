extends Node
class_name RandGlobal

enum ItemType {
	None,
	Fish,
	SunFish,
	Jellyfish
}

var Items = {}
var ItemCount: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func GetNextID() -> int:
	ItemCount += 1
	return ItemCount

func RegisterItem(item: FlockBase):
	if !Items.has(item.ItemType):
		Items[item.ItemType] = {}
	if (!Items[item.ItemType].has(item.ID)):
		Items[item.ItemType][item.ID]
	

func UnregisterItem(item: FlockBase):
	pass
