extends Label

onready var btn1 = $"../Button"
onready var btn2 = $"../Button2"

func _ready():
	yield(button_func(), "completed")
	self.text = "loading..."
	var tween = Tween.new()
	self.add_child(tween)
	tween.interpolate_property(self, "percent_visible", 0, 1, 5)
	tween.start()
	yield(tween, "tween_all_completed")
	tween.queue_free()

func button_func():
	yield(btn1, "pressed")
	yield(btn2, "pressed")
