extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


onready var ScoreText = get_node("Label") 
onready var LivesText = get_node("Lives") 

onready var PauseLabel = get_node("PauseLabel") 
onready var HelloLabel  = get_node("Hello") 


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	UpdateScore()
	UpdateLives()
	get_tree().paused = true
	pass

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().paused = !get_tree().paused
			if get_tree().paused:
				PauseLabel.visible = true
			else :
				PauseLabel.visible =false
		if event.pressed and event.scancode == KEY_SPACE:
			get_tree().paused = false
			HelloLabel.visible = false
			
			
func UpdateScore():
	ScoreText.text = "Score: " + str(Global.Score)
			
func UpdateLives():
	LivesText.text = str(Global.Lives)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
