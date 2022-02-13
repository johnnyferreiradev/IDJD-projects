extends Area2D

export var speed = 100

var screenSize
signal toScore

var blockMovement = false

func _ready():
	screenSize = get_viewport_rect().size

func _process(delta):
	if blockMovement:
		return
	
	var velocity = Vector2()
	
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		
	if Input.is_action_pressed("right"):
		velocity.x += 1
	
	if Input.is_action_pressed("down"):
		velocity.y += 1
		
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	position += velocity * delta
	
	# Impede que o player saia da tela
	position.x = clamp(position.x, 0, screenSize.x)
	position.y = clamp(position.y, 0, screenSize.y)
	
	# Tocar animações certas
	if velocity.y > 0:
		$AnimatedSprite.animation = "down"
	elif velocity.y < 0:
		$AnimatedSprite.animation = "up"

func _on_Player_body_entered(body):
	if body.name == "win":
		emit_signal("toScore")
	else:
		$AudioStreamPlayer2D.play()
	
	position.x = 620
	position.y = 696
	
func restart():
	position.x = 620
	position.y = 696
	
func setBlockMovement(value):
	blockMovement = value
