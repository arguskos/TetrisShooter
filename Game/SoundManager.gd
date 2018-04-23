extends AudioStreamPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var Fires = [preload("res://Assets/sounds/Fire1.wav") , preload("res://Assets/sounds/Fire1.wav") ]
var Explosion1  = preload("res://Assets/sounds/Explosion1.wav")
var Explosion2  = preload("res://Assets/sounds/Explosion1.wav")


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func PlayFire():
	var r = randi()%Fires.size()
	stream = Fires[r]
	play()
	
func PlayExp1():
	stream = Explosion1
	play()
func PlayExp2():
	stream =Explosion2
	play()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
