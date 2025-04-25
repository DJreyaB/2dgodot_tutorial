extends CharacterBody2D


#needs a reference for the player to allow for player following
@onready var player = get_node("/root/Game/Player")

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300
	move_and_slide()
