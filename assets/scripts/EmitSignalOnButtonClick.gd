tool
extends Button

export (int) var damage = 10 setget set_damage

func _pressed():
	EventBus.emit_signal("player_damaged", damage)

func set_damage(new_damage: int):
	damage = new_damage
	self.text = "Emit Damage ["+str(new_damage)+"]"
