extends Button

func _on_Button_pressed():
	
	var sendtext = get_parent().get_node("sendtext").text 
	print(sendtext)
	
	rpc("update", sendtext.to_ascii())
	
remote func update():
	print("update function")
	