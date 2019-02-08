extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client("127.0.0.1", 4242)
	get_tree().set_network_peer(peer)

remote func send(data):
	var x = data.get_string_from_ascii()
	$Label.text = x
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
