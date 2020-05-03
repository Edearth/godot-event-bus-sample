extends Node2D

onready var attack_timer = $AttackTimer

func _ready():
	attack_timer.connect("timeout", self, "attack_player")

func attack_player():
	EventBus.emit_signal("enemy_attack", self.name)
	EventBus.emit_signal("player_damaged", randi()%3 + 2)
