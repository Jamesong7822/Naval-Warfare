extends Node2D

var DATABASE = [["8eaf076881be2bef3c568201b8bcb001", "755707bf235b082adc0a15119ec776d4"]]

func _ready():

	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(4242, 2)
	get_tree().set_network_peer(peer)
	
	$Label.text = "Server creation success"
	
func _on_SendButton_pressed():
	var tosend = $Input.text.to_ascii()
	rpc("send", tosend)
	$Label.text = "Sent..."
	
remote func login(id, username, password):
	print ("ID: ", id)
	print ("Username: ", username)
	print ("Password: ", password)
	if DATABASE[0][0] == username and DATABASE[0][1] == password:
		rpc_id(id, "_on_login_success", true)
	else:
		rpc_id(id, "_on_login_success", false)
	
	
remote func save(data):
	var save_game = File.new()
	save_game.open("./savefile", File.WRITE)
	
	save_game.store_line(to_json(data)) # test case
	var nodes_to_save = get_tree().get_nodes_in_group("Persist")
	for node in nodes_to_save:
		var node_data = node.call("save") # save function to be written for each node
		save_game.store_line(to_json(node_data))
	save_game.close()
	
