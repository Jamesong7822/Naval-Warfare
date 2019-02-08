extends Node2D

func _ready():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(4242, 2)
	get_tree().set_network_peer(peer)
	$Label.text = $Label.text + "Create Server ok!"
	
	peer.connect("peer_connected", self, "_player_connected")

func _player_connected(id):
	$Label.text = $Label.text + "\n Player Connected!, id = " + str(id)
	
func _on_Button_pressed():
	var toSend = $LineEdit.text.to_ascii()
	$Label.text = $Label.text + "\n Sending:" + str(toSend.get_string_from_ascii())
	rpc("send",toSend)




