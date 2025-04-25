extends Area2D


func _physics_process(delta: float) -> void:
	var  enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range[0]
		look_at(target_enemy.global_position)


func shoot():
	#load bullet each time input captured 
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	# gun flips upside down when it goes -x, set up an if for when position has a negative x have 
	# it flip the opposite direction and else face the other way not flipped upside down
	%ShootingPoint.add_child(new_bullet)
	


func _on_timer_timeout() -> void:
	shoot()
