extends CharacterBody2D


var velocidade_do_jogador : float = 200.0
var direcao_do_movimento : Vector2 = Vector2(0, 0)


func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	player_movimento()
	limitar_posicao()

func player_movimento() -> void:
	# Movimentação Horizontal:
	if Input.is_action_pressed("MV_Direita"):
		direcao_do_movimento.x = 1
	elif Input.is_action_pressed("MV_Esquerda"):
		direcao_do_movimento.x = -1
	else:
		direcao_do_movimento.x = 0
	
	# Movimentação Vertical:
	if Input.is_action_pressed("MV_Jump"):
		direcao_do_movimento.y = -1
		
	else:
		direcao_do_movimento.y = 0
	
	# Aplica as mudanças na direção do jogador:
	velocity = direcao_do_movimento.normalized() * velocidade_do_jogador
	move_and_slide()
	
func limitar_posicao() -> void:
	position.x = clamp(position.x, 80, 1200)
	
