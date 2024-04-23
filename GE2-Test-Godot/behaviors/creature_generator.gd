@tool
extends Node3D

@export var length:int = 20
@export var frequency:float = 0.0
@export var start_angle:float = 1.0
@export var base_size:float = 0.5
@export var multiplier:float = 5.0

var paused:bool = true

func _input(event):
	if event.is_action_pressed("pause"): paused = !paused

func _process(delta):
	#if paused:return
	var position_offset = Vector3.ZERO
	var current_size = base_size
	for x in range(length):
		DebugDraw3D.draw_box(Vector3(-current_size/2 + position_offset.x,-current_size/2+position_offset.y,-current_size/2+position_offset.z), Quaternion(), Vector3(current_size,current_size,current_size))
		position_offset.x+=current_size
		#position_offset.y = sin(x)
		current_size += sin(x*frequency) * 0.1

	
	pass		



func _ready():
	if not Engine.is_editor_hint():		
		pass
	



