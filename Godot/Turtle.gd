extends KinematicBody2D

const DOWN = 0
const RIGHT = 1
const UP = 2
const LEFT = 3

var direction = DOWN
var speed = 100
var steps
var count_steps
var screensize

func _ready():
	randomize()
	direction = randi() % 4
	steps = 50 + (randi() % 50)
	count_steps = 0
	screensize = get_viewport_rect().size

func _process(delta):
	count_steps += 1
	if count_steps > steps:
		direction = randi() % 4;
		steps = 50 + (randi() % 50)
		count_steps = 0
	var vel = Vector2()
	if direction == DOWN:
		vel.y += speed
		$AnimatedSprite.animation = "vertical"
		$AnimatedSprite.flip_v = false
	elif direction == RIGHT:
		vel.x += speed
		$AnimatedSprite.animation = "horizontal"
		$AnimatedSprite.flip_h = false
	elif direction == UP:
		vel.y -= speed
		$AnimatedSprite.animation = "vertical"
		$AnimatedSprite.flip_v = true
	elif direction == LEFT:
		vel.x -= speed
		$AnimatedSprite.animation = "horizontal"
		$AnimatedSprite.flip_h = true
	if vel.length() > 0:
		#set_linear_velocity(vel)
		var collision_info = move_and_collide(vel * delta)
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	rotation_degrees = 0
	position.x = clamp(position.x, 0, screensize.x)