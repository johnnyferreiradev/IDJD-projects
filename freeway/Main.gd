extends Node

const newCar = preload("res://Cars.tscn")

var slowRoad= [600, 544, 438, 324, 384, 216, 160]
var fastRoad = [488, 272, 104]

var score1 = 0
var score2 = 0

func _ready():
	$restartButton.hide()
	$theme.play()
	randomize()


func _on_fastCarTimer_timeout():
	var fastCar = newCar.instance()
	add_child(fastCar)
	fastCar.position.x = -10
	fastCar.position.y = fastRoad[randi() % fastRoad.size()]
	fastCar.linear_velocity = Vector2(rand_range(700, 710), 0)


func _on_slowCarTimer_timeout():
	var slowCar = newCar.instance()
	add_child(slowCar)
	slowCar.position.x = -10
	slowCar.position.y = slowRoad[randi() % slowRoad.size()]
	slowCar.linear_velocity = Vector2(rand_range(300, 310), 0)


func _on_Player_toScore():
	if score1 < 3:
		score1 += 1
		$point.play()
		$scoreboard1.text = str(score1)
	if score1 >= 3:
		$restartButton.show()
		$theme.stop()
		$result.text = "Player 1 venceu!"
		$youWin.play()
		$slowCarTimer.stop()
		$fastCarTimer.stop()
		$Player.setBlockMovement(true)
		$Player2.setBlockMovement(true)


func _on_restartButton_pressed():
	$restartButton.hide()
	score1 = 0
	$scoreboard1.text = "0"
	$result.text = ""
	$slowCarTimer.start()
	$fastCarTimer.start()
	$Player.restart()
	$Player.setBlockMovement(false)
	$theme.play()
