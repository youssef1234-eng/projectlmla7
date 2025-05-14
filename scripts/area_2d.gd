extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue.dialogue"))
	pass


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		queue_free()
	pass 
