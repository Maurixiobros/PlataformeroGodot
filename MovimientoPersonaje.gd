extends CharacterBody2D

@export var speed: float = 200
@export var jump_force: float = 300
@export var gravity: float = 500

@onready var sprite = $AnimatedSprite2D  # Acceder al nodo de animación

func _physics_process(delta):
	# Aplicar gravedad
	if not is_on_floor():
		velocity.y += gravity * delta

	# Movimiento lateral
	var direction = Input.get_axis("Move Left", "Move Right")
	
	if direction:
		velocity.x = direction * speed
		sprite.play("Idle")
		sprite.flip_h = direction < 0  # Voltear sprite si va a la izquierda
	else:
		velocity.x = move_toward(velocity.x, 0, speed * delta)
		sprite.play("Idle")

	# Salto (si agregaste la tecla "ui_up" en Input Map)
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = -jump_force  # Hacer que el personaje suba

	move_and_slide()
