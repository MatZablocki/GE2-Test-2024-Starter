@tool
extends Node3D

@export var length:int = 20
@export var frequency:float = 1.0
@export var start_angle:float = 1.0
@export var base_size:float = 0.5
@export var multiplier:float = 5.0
@export var head = load("res://head.tscn")

@export var boid : Boid
var body = load("res://body.tscn")

var paused:bool = true

func _input(event):
	if event.is_action_pressed("pause"): paused = !paused

func _process(delta):
	#if paused:return
	
	
	

	
	pass		



func _ready():
	if not Engine.is_editor_hint():		
		pass
	var head_inst = head.instantiate()
	boid.add_child(head_inst)
	var position_offset = Vector3.ZERO
	var current_size = base_size
	#DebugDraw3D.draw_sphere(Vector3.ZERO, base_size*2)
	for x in range(length):
		var box = body.instantiate()
		box.size = Vector3(current_size,current_size,current_size)
		box.position = Vector3(position_offset.x,0,0)
		boid.add_child(box)
		#DebugDraw3D.draw_box(Vector3(-current_size/2 + position_offset.x,-current_size/2+position_offset.y,-current_size/2+position_offset.z), Quaternion(), Vector3(current_size,current_size,current_size))
		position_offset.x+=current_size
		#position_offset.y = sin(x)
		current_size += sin(x*frequency+start_angle) * 0.1 * multiplier
	



