@tool
extends Node3D

@export var length:int = 20
@export var frequency:float = 1.0
@export var start_angle:float = 1.0
@export var base_size:float = 0.5
@export var multiplier:float = 5.0
@export var head = load("res://head.tscn")
@onready var head_inst = head.instantiate()
var body = load("res://body.tscn")

var box_arr = []

var paused:bool = true

func _input(event):
	if event.is_action_pressed("pause"): paused = !paused
@export var TIMER:float = 0.1
var timer = TIMER

func _process(delta):
	if paused:return
	timer-=delta
	if timer>0:return
	var temp = box_arr[-1].position.y
	for x in range(len(box_arr)):
		var prev_box_y = box_arr[x-1].position.y
		var temp2=box_arr[x].position.y
		box_arr[x].position.y = temp
		temp = temp2
		
	timer = TIMER
	head_inst.position += Vector3(-1,0,0) *0.5
	pass		



func _ready():
	if not Engine.is_editor_hint():		
		pass
	make_boid()
	
func make_boid():
	
	add_child(head_inst)
	var position_offset = Vector3.ZERO
	var current_size = base_size
	#DebugDraw3D.draw_sphere(Vector3.ZERO, base_size*2)
	for x in range(length):
		var box = body.instantiate()
		box.size = Vector3(current_size,current_size,current_size)
		box.position = Vector3(position_offset.x,position_offset.y,0)
		head_inst.add_child(box)
		box_arr.append(box)
		#DebugDraw3D.draw_box(Vector3(-current_size/2 + position_offset.x,-current_size/2+position_offset.y,-current_size/2+position_offset.z), Quaternion(), Vector3(current_size,current_size,current_size))
		position_offset.x+=current_size
		position_offset.y = sin(x)
		current_size += sin(x*frequency+start_angle) * 0.1 * multiplier
	



