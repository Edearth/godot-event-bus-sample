extends Sprite

var final_offset = Vector2(40,0)

func _ready():
	EventBus.connect("enemy_attack", self, "play_attack_animation")

func play_attack_animation(parent_name):
	if parent_name == self.get_parent().name:
		var tween = Tween.new()
		add_child(tween)
		self.offset
		tween.interpolate_property(self, "offset", Vector2.ZERO, final_offset, 1, Tween.TRANS_CUBIC)
		tween.start()
		yield(tween, "tween_all_completed")
		tween.interpolate_property(self, "offset", final_offset, Vector2.ZERO, 1, Tween.TRANS_CUBIC)
		tween.start()
		yield(tween, "tween_all_completed")
		tween.queue_free()
