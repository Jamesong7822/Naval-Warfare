extends Node2D

func _ready():
	var network = NetworkedMultiplayerENet.new()
	network.create_client("127.0.0.1", 4242)
	get_tree().set_network_peer(network)
	network.connect("connection_failed", self, "_on_connection_failed")
	
	
func _on_connection_failed(error):
	$labelStatus.text = "Error connecting to server " + error