extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	#update()
	pass
func _draw():
	pass 
#	for col in Global.Colomns:
#		for row in Global.Rows:
#			if Global.GetGridState(Vector2(col,row)):
#				draw_rect(Rect2(col*Global.BlockSize,row*Global.BlockSize,Global.BlockSize,Global.BlockSize),Color(1,0,0,1))
#			else:
#				draw_rect(Rect2(col*Global.BlockSize,row*Global.BlockSize,Global.BlockSize,Global.BlockSize),Color(0,1,0,1))
#