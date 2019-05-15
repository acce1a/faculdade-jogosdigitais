extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal porta
# Called when the node enters the scene tree for the first time.
func _ready():
	var p = get_node('../Player')
	
	p.connect("key_found",self,"_hide_key")
	

func _hide_key():
	print('hiding key...')
	hide()
	$CollisionShape2D.disabled = true
	#var porta = get_node('../Porta')
	#var teste = porta.$CollisionShape2D.instance()
	#porta.hide()
	emit_signal("porta")
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
