extends Button

func _on_Disconnect_pressed():
	get_tree().set_network_peer(null)