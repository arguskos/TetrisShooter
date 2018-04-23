extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var Width 
var Height 
var BlockSize = 128 / 2 /2 
var Rows 
var Colomns
var Grid  = [] 
var BlockGroups = []

var Score = 0
var SceneRoot 
var Lives = 3

var BlockSpeed = 0.7 
var TimeSpawnMin = 2
var TimeSpawnMax = 5

var BlockTypes = [
	[Vector2(0,0), Vector2(1,0) ,Vector2(0,-1) , Vector2(1,-1)],
	[Vector2(0,0), Vector2(1,0), Vector2(2,0), Vector2(3,0)],
	[Vector2(0,0), Vector2(0,-1), Vector2(0,-2), Vector2(0,-3)],
	[Vector2(0,0), Vector2(1,0), Vector2(2,0), Vector2(1,1)],
	[Vector2(0,0), Vector2(0,-1), Vector2(0,-2), Vector2(1,-1)]
	
	
]

var Colors = [
			Color("ff6666"),
		 	Color("ff3366"),
			Color("33ccff"),
			Color("ffc057"),
			Color("55DDAA")
]


func _process(delta):
	BlockSpeed -= delta / 1000
	TimeSpawnMax -= delta/ 1000
	TimeSpawnMax -= delta/ 1000
	
func Init():
	for col in range(Colomns):
		Grid.append([])
		for row in range(Rows):
			Grid[Grid.size()-1].append(false)
	BlockSpeed = 0.7 
	TimeSpawnMin = 2
	TimeSpawnMax = 5
	Lives = 3 
	Score = 0	
	
func GetSceneRoot():
	if SceneRoot==null:
		SceneRoot = get_tree().get_root().get_node("Panel")
	return SceneRoot
	
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	Width =	ProjectSettings.get_setting("display/window/size/width")
	Height  =	ProjectSettings.get_setting("display/window/size/height")
	Rows = Height / BlockSize 
	Colomns = Width / BlockSize
	Init()
	pass

func DecreaceLive():
	Lives -= 1 
	GetSceneRoot().HUD.UpdateLives()
	if Lives==0:
		get_tree().reload_current_scene()
		SceneRoot=null
		Init()

func ModifyScore(amount):
	Score += amount 
	GetSceneRoot().HUD.UpdateScore()

func GetGridState(pos):
	return  Grid[pos.x][pos.y]

func ToggleCell(pos, state ):
	Grid[pos.x][pos.y] = state

func GetPos(pos):
	return Vector2(pos.x*BlockSize+BlockSize, pos.y*BlockSize+BlockSize)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
