extends KinematicBody2D
class_name BeeBody

export (NodePath) var label_node_path
onready var label_node = get_node(label_node_path)

const UP = Vector2.UP
const FLAP = -700
const MAXFALLSPEED = 200
const GRAVITY = 30

var motion = Vector2.ZERO
var counter = 0

signal score_changed

	
func _physics_process(delta):
	motion.y += GRAVITY
	if (motion.y >= MAXFALLSPEED):
		motion.y = MAXFALLSPEED
	if (Input.is_action_just_pressed("move_up")):
		motion.y += FLAP
	motion.x = 0
	motion = move_and_slide(motion, UP)

func increase_counter():
	counter += 1
	if (label_node):
		label_node.text = str(counter) 
	emit_signal("score_changed", counter)
