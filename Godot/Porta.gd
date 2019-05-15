extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var k = get_node('../Key')
	k.connect("porta",self,"_hide_key")
	

func _hide_key():
	print('escondendo porta...')
	hide()
#	$CollisionShape2D.disabled = true
	#var porta = get_node('../Porta')
	#var teste = porta.$CollisionShape2D.instance()
	#porta.hide()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
