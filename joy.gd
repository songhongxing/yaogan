extends Sprite

var maxLen = 70
var ondraging = -1

func _input(event):
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()):
		var mouse_pos = (event.position - self.global_position).length()
		
		if mouse_pos <= maxLen or event.get_index() == ondraging:
			ondraging = event.get_index()
			$point.set_global_position(event.position)
			
			if get_point_pos().length() > maxLen:
				$point.set_position(get_point_pos().normalized() * maxLen)
			
	if event is InputEventScreenTouch and !event.is_pressed():
		if event.get_index() == ondraging :
			set_center()
			ondraging = -1
	pass
		
		
		
func get_point_pos():
	return $point.position
	pass
	
func set_center():
	$point.position = Vector2(0,0)
	pass
func get_now_pos():
	return get_point_pos().normalized()
	pass
