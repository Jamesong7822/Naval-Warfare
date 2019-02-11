extends Node2D

var my_dict = {}


func _ready():
	# Load Scene - followed by add_child
	var character = load("res://Character.tscn")
	var chat_history = load("res://Chat_History.tscn")
	
	# Instance player
	var player = character.instance()
		
	# Add child - player
	add_child(player)
	# Declare player ID & add to dict
	player.id = 100
	my_dict[player.id] = player
	
	# Instance chat_history scene
	var chatter = chat_history.instance()
	add_child(chatter)
	chatter.set_position(Vector2(300, 300))