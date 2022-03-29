extends Area2D

var obstacle = preload("res://scenes/Obstacle.tscn")
var obstacle_inst
func _ready():
	self.connect("body_entered", self, "on_body_entered")
	self.connect("area_entered", self, "on_area_entered")
	

func on_area_entered(area):	
	area.queue_free()
	obstacle_reset()

func obstacle_reset():
	obstacle_inst = obstacle.instance()
	obstacle_inst.position = Vector2(1500, rand_range(190, 430))
	obstacle_inst.rotation_degrees = rand_range(-7, 7)
	get_parent().call_deferred("add_child", obstacle_inst)
	
