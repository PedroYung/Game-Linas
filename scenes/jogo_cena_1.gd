extends Node2D

@onready var animation := $Lina/lina_body as AnimatedSprite2D

func _on_kill_block_1_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().reload_current_scene()


func _on_kill_block_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().reload_current_scene()


func _on_kill_block_3_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().reload_current_scene()





func _ready() -> void:
	pass
