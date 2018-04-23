extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var Pos = Vector2(0,0)

var Health = 2

func _ready():
	# Called every time the node is added to the scene.
	# Initialization 
	pass
	
func Hit():
	Health -= 1
	if Health == 0 :
		Global.GetSceneRoot().SoundManager.PlayExp1()
		Global.ModifyScore(20)
		get_parent().Destroy(self)
		
func Move():
	#Global.ToggleCell(Pos,false)
	Pos += Vector2(0,1)
	#Global.ToggleCell(Pos,true)
	position = Global.GetPos(Pos)
#	if Pos.y == Global.Rows-1 :
#		Moving= false
	
#func _process(delta):
#	if Moving :
#		Time += delta
#		if Time>ChangePosTime: 
#			Move()
#			Time = 0 
#			print(Pos)
#			position = Global.GetPos(Pos)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
