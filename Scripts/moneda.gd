extends Area2D

func _on_body_entered(body: Node2D):
	if body.is_in_group("Jugador"):
		if body.has_method("recolectar_moneda"):
			body.recolectar_moneda()
	print("Moneda +1")
	queue_free()
