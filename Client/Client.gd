extends Node2D

var DATA = {"name": "Sir Great",
			"level": 99,
			"experience": 188310,
			"health": 186,
			"def": 50,
			"speed": 18,
			}
			

func _ready():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client("127.0.0.1", 4242)
	get_tree().set_network_peer(peer)
	$Display.text = "Input here"
	
remote func send(data):
	print ("Receiving")
	var text = data.get_string_from_ascii()
	print(text)
	$Display.text = text




func _on_SaveButton_pressed():
	rpc("save", DATA)
