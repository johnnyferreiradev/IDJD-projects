extends RigidBody2D


func _ready():
	var carColor = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = carColor[randi() % carColor.size()]


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
