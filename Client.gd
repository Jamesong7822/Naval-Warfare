extends Node2D

func _ready():
	var network = NetworkedMultiplayerENet.new()
	network.create_client("127.0.0.1", 4242)
	get_tree().set_network_peer(network)
	network.connect("connection_failed", self, "_on_connection_failed")
#	get_tree().get_var("network_peer_packet", self, "_on_packet_received")
	
	
func _on_connection_failed(error):
	$labelStatus.text = "Error connecting to server " + error
	
func _on_packet_received(id, packet):
	$ServerResponse.text = packet.get_string_from_ascii()
	
remote func update(data):
	print ("yo")
	$ServerResponse.text = data 