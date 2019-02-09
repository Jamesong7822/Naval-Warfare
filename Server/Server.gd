extends Node2D

func _ready():

	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(4242, 2)
	get_tree().set_network_peer(peer)
	
	$Label.text = "Server creation success"
	
func _on_SendButton_pressed():
	var tosend = $Input.text.to_ascii()
	rpc("send", tosend)
	$Label.text = "Sent..."
	
remote func login(username, password):
	print (username.md5_text(), password.md5_text())
	
	
remote func save(data):
	var save_game = File.new()
	save_game.open("./savefile", File.WRITE)
	
	save_game.store_line(to_json(data)) # test case
	var nodes_to_save = get_tree().get_nodes_in_group("Persist")
	for node in nodes_to_save:
		var node_data = node.call("save") # save function to be written for each node
		save_game.store_line(to_json(node_data))
	save_game.close()
	
