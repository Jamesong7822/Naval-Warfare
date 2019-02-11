extends Node2D

func _ready():
	# Linking Signals
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_not_ok")

func _connected_ok():
	print ("Connected ok!")
	var username = $Username.text.md5_text()
	var password = $Password.text.md5_text()
	
	# Send the data
	rpc("login", get_tree().get_network_unique_id(), username, password)

func _connected_not_ok():
	$Response.text = "Connection Failed. Recheck ip and port"
	
remote func _on_login_success(status):
	print ("Login ", status, "!")

func _on_LoginButton_pressed():
	var ip_add = $IP_Add.text
	var port = $Port.text
	
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(ip_add, int(port))
	get_tree().set_network_peer(peer)
	

	

	
