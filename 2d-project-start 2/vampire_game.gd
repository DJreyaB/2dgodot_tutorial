extends Node2D


func spawn_mob():
	var new_mob = preload("res://slime_enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	


func _on_mob_timeout() -> void:
	spawn_mob()


func _on_player_health_depleted() -> void:
	%Game_Over.visible = true
	# pause game by accessing scene tree
	get_tree().paused = true
