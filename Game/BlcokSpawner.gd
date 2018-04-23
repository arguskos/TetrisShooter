extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const block = preload ("res://Game/Blocks/Block.tscn")
const BlockGroup  = preload("res://Game/Blocks/BlockGroup.tscn")



var SpawnTimer = 0



func _ready():
	randomize()
	# Called every time the node is added to the scene.
	# Initialization here
	var array = Global.BlockTypes[0]
	
	
	
	SpawnTimer =  Global.TimeSpawnMin
	pass

func GetRandomX(blockGroup):
	var x = randi()%(Global.Colomns-int(blockGroup[blockGroup.size()-1].x))
	return x 
	
func _process(delta):
	SpawnTimer -= delta 
	if SpawnTimer <= 0:
#		var array = Global.BlockTypes[1]
#
#		Generate(array,0)
#		Generate(array,4)
#		Generate(array,8)
#
#		SpawnTimer = 333333
		#Generate(array,3)
		SpawnTimer = Global.TimeSpawnMin + rand_range(Global.TimeSpawnMin,Global.TimeSpawnMax)
		var blockType = Global.BlockTypes[randi()%Global.BlockTypes.size()]
		var xShift = GetRandomX(blockType)
		Generate(blockType,xShift)#randi()%Global.BlockTypes.size()])
	pass 
		
func Generate(arr,xShift):
	
	var group = BlockGroup.instance()
	get_parent().add_child(group)
	var color = Global.Colors[randi()%Global.Colors.size()]
	for point in arr:
		var b = block.instance()
		b.Pos = point+Vector2(xShift,0)
		group.Blocks.append(b)
		group.Positions.append(b.Pos)
		b.position = Global.GetPos(b.Pos)
		b.self_modulate = color
		group.add_child(b)
		group.Init()
	get_parent().BlockGroups.append(group)	
	#Global.BlockGroups.append(group)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
