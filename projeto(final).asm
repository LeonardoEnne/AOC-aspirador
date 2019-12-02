# 16,16,512,512,heap

.data
	#Alguns exemplos de cores
	green2:   .word 0x90EE90
	white:	  .word 0xFFFFFF
	MARROM:   .word 0x8B4513
	green:    .word 0x6B8E23
	black:	  .word 0x00000
	
.text
	j main
	
	set_tela: #Inicia todos os valores para a tela
		addi $t0, $zero, 65536 #65536 = (512*512)/4 pixels
		add $t1, $t0, $zero #Adicionar a distribuição de pixels ao endereco
		lui $t1, 0x1004 #Endereco base da tela no heap, pode mudar se quiser
		add $t0, $zero, $t1
		addi $t2, $zero, 0
		loop: 
			sw $s4, ($t0) #Pinto o pixel na posicao $t0 com a cor de $s4
			addi $t0, $t0, 4 #Pulo +4 no pixel
			addi $t2, $t2, 1 #Contador +1
			beq $t2, 1024, exit
			j loop
		exit:
			jr $ra

	set_cores: #Salvar as cores em registradores
		lw $s3, green2
		lw $s4, white
		lw $s5, black
		lw $s6, MARROM
		lw $s7, green
		jr $ra

	planta_baixa:
		add $t0, $zero, $t1
		addi $t2, $zero, 0
		loop_1: 
			sw $s5, ($t0) 
			addi $t0, $t0, 4 
			addi $t2, $t2, 1 #Contador +1
			beq $t2, 31, exit_1
			j loop_1
	exit_1:
		addi $t2, $zero, 0
		loop_2: 
			sw $s5, ($t0) 
			addi $t0, $t0, 128
			addi $t2, $t2, 1 #Contador +1
			beq $t2, 31, exit_2
			j loop_2
	exit_2:
		addi $t2, $zero, 0
		loop_3: 
			sw $s5, ($t0) 
			subi $t0, $t0, 4
			addi $t2, $t2, 1 #Contador +1
			beq $t2, 31, exit_3
			j loop_3
	exit_3:
		addi $t2, $zero, 0
		loop_4: 
			sw $s5, ($t0) 
			subi $t0, $t0, 128
			addi $t2, $t2, 1 #Contador +1
			beq $t2, 31, exit_4
			j loop_4
	exit_4:
		addi $t2, $zero, 0
		addi $t0,$t1,1288
		loop_5: 
			sw $s5, ($t0) 
			addi $t0, $t0, 4
			addi $t2, $t2, 1 #Contador +1
			beq $t2, 29, exit_5
			j loop_5
	exit_5:
		addi $t2, $zero, 0
		addi $t0,$t0,1292
		loop_6: 
			sw $s5, ($t0) 
			addi $t0, $t0, 4
			addi $t2, $t2, 1 #Contador +1
			beq $t2, 29, exit_7
			j loop_6
	exit_6:
		addi $t2, $zero, 0
		addi $t0,$t0,20
		loop_7: 
			sw $s5, ($t0) 
			addi $t0, $t0, 4
			addi $t2, $t2, 1 #Contador +1
			beq $t2, 14, exit_7
			j loop_7
	exit_7:
		jr $ra
		
	gerar_moveis:
	
		li $a1,923
	
		li $v0,42
		add $a0,$a0,0	#140 limite inferior
		syscall
		add $a0,$a0,$a0
		add $a0,$a0,$a0
		addi $a0,$a0,140
	
		add $t0,$t1,$a0
	
		lw $t3,($t0)	
		
				
		#movel longe de parade ou outro moveis		
				
		addi $t5,$t0,4
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis
		addi $t5,$t0,-4
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis
		addi $t5,$t0,128
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis
		addi $t5,$t0,-128
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis
		addi $t5,$t0,124
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis
		addi $t5,$t0,-132
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis
		
		addi $t5,$t0,8
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis
		addi $t5,$t0,0
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis
		addi $t5,$t0,132
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis
		addi $t5,$t0,-124
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis

		addi $t5,$t0,12
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis
		addi $t5,$t0,4
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis
		addi $t5,$t0,136
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis
		addi $t5,$t0,-120
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis
		addi $t5,$t0,140
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis
		addi $t5,$t0,-116
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis

		
		addi $t4,$t3,8
		beq $t4,$s5,gerar_moveis
		sw $s5, ($t0)
		addi $t0,$t0,4
		sw $s5, ($t0)
		addi $t0,$t0,4
		sw $s5, ($t0)
		addi $t2,$t2,1 #contador +1
		beq $t2,5,saida
	
	
		j gerar_moveis

		saida:
			jr $ra

	gerar_moveis2:
		li $a0,0
		li $a1,955 #3820 / 4 , limite superior - 140 do inferior q sera somado
	
		li $v0,42
		add $a0,$a0,0	#140 limite inferior
		syscall
		add $a0,$a0,$a0
		add $a0,$a0,$a0
		addi $a0,$a0,140
	
		add $t0,$t1,$a0
	
		lw $t3,($t0)
		
		
		addi $t5,$t0,4
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis2
		beq $t6,$s6,gerar_moveis2
		addi $t5,$t0,-4
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis2
		beq $t6,$s6,gerar_moveis2
		addi $t5,$t0,128
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis2
		beq $t6,$s6,gerar_moveis2
		addi $t5,$t0,-128
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis2
		beq $t6,$s6,gerar_moveis2
		addi $t5,$t0,124
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis2
		beq $t6,$s6,gerar_moveis2
		addi $t5,$t0,-132
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis2
		beq $t6,$s6,gerar_moveis2
		addi $t5,$t0,-124
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis2
		beq $t6,$s6,gerar_moveis2
		addi $t5,$t0,132
		lw $t6,0($t5)
		beq $t6,$s5,gerar_moveis2
		beq $t6,$s6,gerar_moveis2
		
		

		
		beq $t3,$s5,gerar_moveis2 #se for parede
		sw $s6, ($t0)
		addi $t2,$t2,1 #contador +1
		beq $t2,5,saida2
	
	
		j gerar_moveis2

		saida2:
			jr $ra
	acima_livre:
		subi $t3,$t0,128
		lw $t4,($t3)
		beq $t4,$s4,aspirado
		beq $t4,$s5, direita_livre
		beq $t4,$s3, direita_livre
		beq $t4,$s6, direita_livre
		
		j aspirado

	direita_livre:
		addi $t3,$t0,4
		lw $t4,($t3)
		beq $t4,$s4,aspirado
		beq $t4,$s5, esquerda_livre
		beq $t4,$s3, esquerda_livre
		
		j aspirado

	esquerda_livre:
		subi $t3,$t0,4
		lw $t4,($t3)
		beq $t4,$s4,aspirado
		beq $t4,$s5, baixo_livre
		beq $t4,$s3, baixo_livre
		
		j aspirado
	
	baixo_livre:
		addi $t3,$t0,128
		lw $t4,($t3)
		beq $t4,$s4,aspirado
		beq $t4,$s5, travado
		beq $t4,$s3, travado
		
		j aspirado
		
	

	travado:
		addi $t3,$t0,128
		lw $t4,($t3)
		beq $t4,$s3, aspirado
		beq $t4,$s6, aspirado
						
		subi $t3,$t0,4
		lw $t4,($t3)
		beq $t4,$s3, aspirado
		beq $t4,$s6, aspirado
		
		addi $t3,$t0,4
		lw $t4,($t3)
		beq $t4,$s3, aspirado
		beq $t4,$s6, aspirado
		
		subi $t3,$t0,128
		lw $t4,($t3)
		beq $t4,$s3, aspirado
		beq $t4,$s6, aspirado
		
	
	aspira:
		add $t0,$t1,132
		sw $s7, ($t0)
		addi $t2, $zero, 0
		loop_8: 
			j acima_livre
			
			aspirado:
				add $t4,$t0,$zero
				lw $t6,($t4)
				addi $t0,$t3,0
				lw $t5,($t0)
				
				
				beq $t6,$s6,pula2
				sw $s3, ($t4)
				beq $t5,$s5,pula
				beq $t6,$s5,pula
				beq $t5,$s6,pula
# s5 black, s6 marrom, s7 verde escuro,s3 verde claro	
			pula2:	sw $s7, ($t0) 
				
				addi $t2, $t2, 1 #Contador +1
				beq $t2, 900, exit_8
			pula:
				li $v0,32
				li $a0,80
				syscall
			
				j loop_8
		exit_8:
			jr $ra
	main: 
		jal set_cores
		jal set_tela
		jal planta_baixa
		addi $t2, $zero, 0
		jal gerar_moveis
		addi $t2, $zero, 0
		jal gerar_moveis2
		jal aspira
