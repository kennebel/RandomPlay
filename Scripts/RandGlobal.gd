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
	randomize()


func GetNextID() -> int:
	ItemCount += 1
	return ItemCount


func RegisterItem(newReg: FlockBase):
	if !Items.has(newReg.ItemType):
		Items[newReg.ItemType] = {}
	if (!Items[newReg.ItemType].has(newReg.ID)):
		Items[newReg.ItemType][newReg.ID] = newReg


func UnregisterItem(oldReg: FlockBase):
	if Items.has(oldReg.ItemType) and Items[oldReg.ItemType].has(oldReg.ID):
		Items[oldReg.ItemType].erase(oldReg.ID)


func GroupCount(forType: ItemType) -> int:
	if Items.has(forType):
		return Items[forType].size
	return 0


func GroupItems(forType: ItemType):
	if Items.has(forType):
		return Items[forType]
	return {}
