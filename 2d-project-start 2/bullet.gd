extends Area2D

var travelled_distance = 0
	
func _physics_process(delta: float) -> void:
	const SPEED = 1000
	const RANGE = 1200 # make this equal to the radius of the collision circle on the weapon
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta #uses delta t
	
	travelled_distance += SPEED * delta
	
	if travelled_distance > RANGE:
		queue_free()
	
	# use a signal to remove bullet when it reaches distance length or hits a target
	


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
