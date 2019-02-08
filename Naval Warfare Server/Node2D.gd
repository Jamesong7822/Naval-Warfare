extends Node2D

func _ready():
	var network = NetworkedMultiplayerENet.new()
	network.create_server(4242, 2)
	get_tree().set_network_peer(network)
	
	network.connect("peer_connected", self, "_peer_connected")
	network.connect("peer_disconnected", self, "_peer_disconnected")
	
func _peer_connected(id):
	$Label_Status.text = $Label_Status.text + "\nUser " + str(id) + " connected"
	$Label_User_Count.text = "Total Users: " + str(get_tree().get_network_connected_peers().size())
	
func _peer_disconnected(id):
	$Label_Status.text = $Label_Status.text + "\nUser " + str(id) + " disconnected"
	$Label_User_Count.text = "Total Users: " + str(get_tree().get_network_connected_peers().size())
