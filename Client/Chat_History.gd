extends Node2D

var num = 0
var num2 = 0
var text_buffer = []
var id_buffer = []

func say(id, text):
	# Get img from id - with load function
	var img = load(get_parent().my_dict[id].sprite_img)
	
	if num == 0:
		num += 1
	
		# Set the texture to my loaded img
		$HBoxContainer/Sprite.texture = img
		
		# Update text
		$HBoxContainer/Label.text = text 
		$HBoxContainer/Label/Timer.start()
		print('printing 1')
		
	elif num2 == 0:
		num2 += 1
		# Set the texture to my loaded img
		$HBoxContainer/Sprite.texture = img
		
		# Update text
		$HBoxContainer/Label2.text = text 
		$HBoxContainer/Label2/Timer2.start()
		print('printing 2')
		
	else:
		print('appending text')
		text_buffer.append(text)
		print(text_buffer)
		id_buffer.append(id)
		print(id_buffer)
	
func _ready():
	say(100, "Hi, my name is james.")
	say(100, "Hi, my name is philip.")
	say(100, "Hi, my name is andy.")



func _on_Timer_timeout():
	$HBoxContainer/Label.set_visible_characters(num)
	num += 1
	if num < len($HBoxContainer/Label.text):
		$HBoxContainer/Label/Timer.start()
		
	else:
		$HBoxContainer/Label/Timer.stop()
		num = 0
		$HBoxContainer/Label.set_visible_characters(num)
		if text_buffer != []:
			say(id_buffer.pop_front(),text_buffer.pop_front())
		else:
			$HBoxContainer/Label.set_visible_characters(num)
	


func _on_Timer2_timeout():
	$HBoxContainer/Label2.set_visible_characters(num2)
	num2 += 1
	if num2 < len($HBoxContainer/Label2.text):
		$HBoxContainer/Label2/Timer2.start()
	else:
		$HBoxContainer/Label2/Timer2.stop()
		num2 = 0
		$HBoxContainer/Label2.set_visible_characters(num2)
		if text_buffer != []:
			say(id_buffer.pop_front(),text_buffer.pop_front())
		else:
			$HBoxContainer/Label2.set_visible_characters(num2)

