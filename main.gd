extends Node2D

onready var joystick = $joystick

var joyx = 0
var joyy = 0

func _ready():
	joyx = joystick.position.x
	joyy = joystick.position.y

func _process(delta):
	$KinematicBody2D.move_and_slide(joystick.get_now_pos() * 200)
	pass


func _input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		joystick.position = event.position
	if event is InputEventScreenTouch and !event.is_pressed():
		joystick.position.x = joyx
		joystick.position.y = joyy
	pass
