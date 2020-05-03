extends Label

var visible_color = Color(1,1,1,1)
var invisible_color = Color(1,1,1,0)
var animation_time = 2 #seconds

func _ready():
	EventBus.connect("player_damaged", self, "show_damage")
	self.modulate = invisible_color

func show_damage(damage):
	self.text = "-%d" % damage
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(self, "margin_top", -70, -120, animation_time, Tween.TRANS_LINEAR)
	tween.interpolate_property(self, "modulate", invisible_color, visible_color, animation_time/2, Tween.TRANS_CUBIC)
	tween.start()
	yield(tween, "tween_completed")
	tween.interpolate_property(self, "modulate", visible_color, invisible_color, animation_time/2, Tween.TRANS_CUBIC)
	tween.start()
	yield(tween, "tween_all_completed")
	tween.queue_free()
