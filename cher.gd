extends Area2D

@onready var game: Node = %game

func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		queue_free()
		game.add_point()
