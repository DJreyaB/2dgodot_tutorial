extends CharacterBody2D


func _physics_process(delta: float) -> void:
	#setting it up to get location
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600 #base variable, no need to define its an exisitng variable, this is an update
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
