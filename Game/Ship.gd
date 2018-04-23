extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var SpeedVert = 100
export var SpeedHoriz = 120  

const Bullet = preload("res://Game/Bullet.tscn")
onready var   SoundManager  = get_node("../SoundManager")


export var ShootReload = 0.25
var ShootTimer = 0 
var ImuneTimer = 0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	SoundManager  = get_node("../SoundManager")
	pass

func _input(event):
	pass 

func CreateBullet():
	var b = Bullet.instance()
	b.position = position + Vector2(0,-5)
	get_parent().add_child(b)
	ShootTimer = ShootReload
	SoundManager.PlayFire()

func Death():
	position = Vector2(200,400)
	ImuneTimer = 1.5
	modulate =Color(1,1,1,0.3)
	Global.DecreaceLive()
	
	
func _process(delta):
	
	if ShootTimer >0:
		ShootTimer -= delta
	var vector = Vector2(0,0)
	if Input.is_key_pressed(KEY_W):
		vector = Vector2(0,-1)*SpeedVert * delta
	if Input.is_key_pressed(KEY_S):
		vector = Vector2(0,1)*SpeedVert * delta
	if Input.is_key_pressed(KEY_D):
		vector = Vector2(1,0 )*SpeedHoriz * delta
	if Input.is_key_pressed(KEY_A):
		vector = Vector2(-1,0)*SpeedHoriz *delta
	if Input.is_key_pressed(KEY_SPACE) and ShootTimer<=0:
		CreateBullet()
	var p = move_and_collide(vector)
	if ImuneTimer == 0:
		if p != null:
			Death()
	else:
		ImuneTimer -= delta 
		if ImuneTimer<=0:
			ImuneTimer = 0
			modulate =Color(1,1,1,1)
			
		
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
