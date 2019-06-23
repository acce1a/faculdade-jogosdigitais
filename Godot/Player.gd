extends KinematicBody2D
var speed = 100
var screensize
signal key_found
var is_game_finished = false

func _ready():
	screensize = get_viewport_rect().size
	
func _process(delta):
	var vel = Vector2()
	
	if Input.is_action_pressed("ui_down"):
		vel.y += speed
		$AnimatedSprite.animation = "vertical"
		$AnimatedSprite.flip_v = false
	elif Input.is_action_pressed("ui_right"):
		vel.x += speed
		$AnimatedSprite.animation = "horizontal"
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_up"):
		vel.y -= speed
		$AnimatedSprite.animation = "vertical"
		$AnimatedSprite.flip_v = true
	elif Input.is_action_pressed("ui_left"):
		vel.x -= speed
		$AnimatedSprite.animation = "horizontal"
		$AnimatedSprite.flip_h = true
	elif Input.is_key_pressed(32) and is_game_finished:
		get_tree().reload_current_scene()
	if vel.length() > 0:
		var collision_info = move_and_collide(vel * delta)
		if collision_info:
			if ('Turtle' in collision_info.get_collider().name):
				hide()
				$CollisionShape2D.disabled
				get_node('../Label2').show()
				get_node('../Endgame').show()
				is_game_finished = true
				get_node('../death_sound').play()
			
			if ('Key' in collision_info.get_collider().name):
				emit_signal("key_found")
				print('key found!!!')
				get_node('../key_sound').play()
			if ('Porta' in collision_info.get_collider().name):
				if not get_node("../Porta").is_visible():
					print('FIM DE JOGO')
					get_node('../Label').show()
					get_node('../Endgame').show()
					get_node('../end_sound').play()
					is_game_finished = true
					hide()
					
	
	
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	rotation_degrees = 0
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)