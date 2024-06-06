extends Node2D

onready var shaker_scene = preload("res://Sprite.tscn")
onready var center_point = $CenterPoint

# Instance the child node
onready var bottle = shaker_scene.instance()
var last_position: Vector2 = Vector2.ZERO

func _ready():
	last_position = bottle.position
	# get viewport
	var viewport = get_viewport()
	#calculate center of screen
	var center = viewport.size / 2
	print("Center of screen : ", center)
	
	# Set ankor point
	center_point.position = Vector2(center.x + 100, center.y)  # Set the coordinates here
	#print(center_point.position)
	
	# Add the child node to the scene tree
	add_child(bottle)
	# Set the position of the child node
	bottle.position = Vector2(center_point.position.x + radius , center_point.position.y)

# Controllers
var is_moving = false
var d = 0.0 # constant for how much delta has passed
var radius = -200.0
var speed = 2.0

func _process(delta):
	if is_moving:
		d += delta * speed
		
		# Calculate new position based on initial angle
		var new_position = center_point.position + Vector2(
			cos(d) * radius,
			sin(d) * radius
		)
		
		# Check if the angle exceeds 90 degrees
		if d > PI / 2:  # 90 degrees in radians
			new_position = center_point.position + Vector2(
				cos(PI / 2) * radius,
				sin(PI / 2) * radius
			)
			is_moving = false  # Stop movement
			
		bottle.position = new_position
		last_position = bottle.position


func _on_Button_pressed():
	is_moving = !is_moving


func _on_Button2_pressed():
	pass
