extends Area2D

func _ready():
	self.connect("body_entered", self, "on_body_entered")
	
	
func on_body_entered(body):
	body.increase_counter()
	queue_free()
