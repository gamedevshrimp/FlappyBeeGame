extends Area2D

#var lvl_complete_node = preload("res://scenes/LevelCompleteUI.tscn")
export (PackedScene) var lvl_complete_node

func _ready():
	pass
	self.connect("body_entered", self, "on_body_entered")
	
func _physics_process(delta):
	position += Vector2(-2, 0)

func on_body_entered(body):
	if (body.is_in_group("bee")):
		get_tree().paused = true
		body.visible = false
		var lvl_complete_node_inst = lvl_complete_node.instance()
		get_parent().add_child(lvl_complete_node_inst)
