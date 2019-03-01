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
		$Sprite.texture = img
		
		# Update text
		$VBoxContainer/Label.text = text 
		$VBoxContainer/Label/Timer.start()
		print('printing 1')
		
	elif num2 == 0:
		num2 += 1
		# Set the texture to my loaded img
		$Sprite.texture = img
		
		# Update text
		$VBoxContainer/Label2.text = text 
		$VBoxContainer/Label2/Timer2.start()
		print('printing 2')
		
	else:
		print('appending text')
		text_buffer.append(text)
		print(text_buffer)
		id_buffer.append(id)
		print(id_buffer)
	
func _ready():
	say(100, "Hi, my name is jamesong7822 and I love to sleep")
	say(100, "Hi, my name is philip.")
	say(100, "Hi, my name is andy.")
	say(100, "Hi, my name is james.")
	say(100, "Hi, my name is philip.")
	say(100, "Hi, my name is andy.")
	

func _on_Timer_timeout():
	$VBoxContainer/Label.set_visible_characters(num)
	num += 1
	if num < len($VBoxContainer/Label.text):
		$VBoxContainer/Label/Timer.start()
		
	else:
		$VBoxContainer/Label/Timer.stop()
		num = 0
		$VBoxContainer/Label.set_visible_characters(num)
		if text_buffer != []:
			say(id_buffer.pop_front(),text_buffer.pop_front())
		else:
			$AnimationPlayer.play("Fadeout")
			yield($AnimationPlayer, "animation_finished")
			
#			$VBoxContainer/Label.set_visible_characters(num)
	


func _on_Timer2_timeout():
	$VBoxContainer/Label2.set_visible_characters(num2)
	num2 += 1
	if num2 < len($VBoxContainer/Label2.text):
		$VBoxContainer/Label2/Timer2.start()
	else:
		$VBoxContainer/Label2/Timer2.stop()
		num2 = 0
		$VBoxContainer/Label2.set_visible_characters(num2)
		if text_buffer != []:
			say(id_buffer.pop_front(),text_buffer.pop_front())
		else:
			$VBoxContainer/Label2.set_visible_characters(num2)

