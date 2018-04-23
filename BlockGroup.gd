extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const BlockGroupRef = preload("res://Game/Blocks/BlockGroup.tscn")

var Time  = 0 
var Blocks = []
var Positions = []
export var ChangePosTime = 0.7
var Moving = true 

func _ready():
	ChangePosTime = Global.BlockSpeed
	print(ChangePosTime)
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

class MyCustomSorter:
	static func sort(a, b):
		if a.x < b.x:
			return true
		return false
	
func Init():
	Positions.sort_custom(MyCustomSorter,"sort")

func Destroy(block):
	Blocks.erase(block)
	var index = Positions.find(block.Pos)
	Positions.remove(index)
	Global.ToggleCell(block.Pos,false)
	block.queue_free()
	if  Positions.size()==0:
		Global.ModifyScore(100)
		get_parent().Destroy(self)
		return 
	Init()
	print(Positions)
	#Slice(index)
	
	
func Slice(index):
	var groupLeft = BlockGroupRef.instance()
	var groupRight = BlockGroupRef.instance()
	print(index)
	for i in range(Positions.size()):
		print(i)
		var block = Blocks[Blocks.find(Positions[i])]
		block.get_parent().remove_child(block)
		if i < index:
			groupLeft.add_child(block)
			groupLeft.Blocks.append(block)
			groupLeft.Positions.append(Positions[i])
		else:
			groupRight.add_child(block)
			groupRight.Blocks.append(block)
			groupRight.Positions.append(Positions[i])
			
	get_parent().add_child(groupLeft)
	get_parent().add_child(groupRight)
	
	for b in groupLeft.Blocks:
		b.self_modulate= Color(1,0,0)
	queue_free()
			
func CanMove():
	for b in Blocks: 
		if (b.Pos.y == Global.Rows-1):
			return false 
		if !Positions.has(b.Pos+Vector2(0,1)) and Global.GetGridState(b.Pos+Vector2(0,1)):# == b.Pos.y-1:
			return false
	return true 

func CheckRow():
	for row in range(Global.Rows-1,0,-1):
		var blow = true
		for col in range(Global.Colomns):
			if !Global.GetGridState(Vector2(col,row)):	 
				blow = false
				continue 
		if blow:
			Global.ModifyScore(400)
			Global.GetSceneRoot().SoundManager.PlayExp2()
			for col in range(Global.Colomns):
				Global.ToggleCell(Vector2(col,row),false)	
				for group in get_parent().BlockGroups:
					for block in group.Blocks:
						if block.Pos == Vector2(col,row):
							group.Destroy(block)
func _process(delta):
	if Moving :
		Time += delta
		if Time>ChangePosTime: 
			if CanMove():
				for b in Blocks:
					b.Move()
				for pIndex in range(Positions.size()):
					Global.ToggleCell(Positions[pIndex],false)
					Positions[pIndex]+=Vector2(0,1)
					Global.ToggleCell(Positions[pIndex],true)
				CheckRow()
				Time = 0 
			#position = Global.GetPos(Pos)