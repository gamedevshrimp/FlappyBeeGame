extends Node

func reload():
	get_tree().reload_current_scene()
	get_tree().paused = false

