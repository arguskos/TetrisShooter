extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var BlockGroups = []
onready var HUD = get_node("CanvasLayer/HUD") 
onready var SoundManager = get_node("SoundManager")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	HUD = get_node("CanvasLayer/HUD") 
	SoundManager = get_node("SoundManager")
	pass

func Destroy(group):
	BlockGroups.erase(group)
	group.queue_free()
	
#func _process(delta
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
