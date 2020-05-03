extends Label

var visibleColor = Color(1,1,1,1)
var invisibleColor = Color(1,1,1,0)
var animationTime = 2 #seconds

func _ready():
	EventBus.connect("player_damaged", self, "show_damage")

func show_damage(damage):
	visible = true
	var tween = Tween.new()
	add_child(tween)
	
	tween.interpolate_property(self, "margin_top", -70, -120, animationTime, Tween.TRANS_LINEAR)
	tween.interpolate_property(self, "modulate", invisibleColor, visibleColor, animationTime/2, Tween.TRANS_CUBIC)
	tween.start()
	yield(tween, "tween_completed")
	tween.interpolate_property(self, "modulate", visibleColor, invisibleColor, animationTime/2, Tween.TRANS_CUBIC)
	tween.start()
	yield(tween, "tween_all_completed")
	tween.queue_free()
	visible = false
