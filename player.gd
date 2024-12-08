extends CharacterBody2D


var SPEED : float = 300.0
var health : float = 100: 
	set(value):
		health = value
		%Health.value = value


func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left","right","up","down") * SPEED
	move_and_collide(velocity * delta)

func take_damage(amount):
	health -= amount
	print(amount)

func _on_self_damage_body_entered(body: Node2D) -> void:
	take_damage(body.damage)



func _on_timer_timeout() -> void:
	%PlayerCollision.set_deferred("disabled",true)
	%PlayerCollision.set_deferred("disabled",false)
