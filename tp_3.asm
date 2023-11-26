.text

  .globl main
main:
  # Armazena os endere�os de A, B. C e D
  la $s1, A
  la $s2, B
  la $s3, C
  la $s4, D
  
  # Carrega o tamanho do vetor 
  la $t0, n
  lw $s0, 0($t0)

  # Sub-rotina de adi��o - Preenche o vetor C
  jal addition
  # Salva o vetor
  jal subtraction
  # Salva o vetor
  
  j end
  
# for (int i = n; i > 0; i--) {
#     C[i] = A[i] + B[i];
# }
addition:
  # Endere�os tempor�rios
  add $t1, $s1, $zero  # Inicia endere�o do vetor A
  add $t2, $s2, $zero  # Inicia endere�o do vetor B
  add $t3, $s3, $zero  # Inicia endere�o do vetor C
  # Define uma vari�vel para controle do loop
  add $t0, $s0, $zero
loop_add:
  blez $t0, return # Se n <= 0, ent�o sai do loop   
  lw $t5, 0($t1)  # Carrega o conte�do do vetor A
  lw $t6, 0($t2)  # Carrega o conte�do do vetor B
  add $t7, $t5, $t6  # soma = A[i] + B [i] 
  sw $t7, 0($t3) # C[i] = soma
  
  subi $t0, $t0, 1  # Diminui o contador n--
  addi $t1, $t1, 4  # Avan�a o endere�o do vetor em uma posi��o
  addi $t2, $t2, 4  # Avan�a o endere�o do vetor em uma posi��o
  addi $t3, $t3, 4  # Avan�a o endere�o do vetor em uma posi��o
  j loop_add
  
# for (int i = n; i > 0; i--) {
#     D[i] = A[i] - B[i];
# }
subtraction:
  # Endere�os tempor�rios
  add $t1, $s1, $zero  # Inicia endere�o do vetor A
  add $t2, $s2, $zero  # Inicia endere�o do vetor B
  add $t4, $s4, $zero  # Inicia endere�o do vetor C
  # Define uma vari�vel para controle do loop
  add $t0, $s0, $zero
loop_sub:
  blez $t0, return # Se n <= 0, ent�o sai do loop   
  lw $t5, 0($t1)  # Carrega o conte�do do vetor A
  lw $t6, 0($t2)  # Carrega o conte�do do vetor B
  sub $t7, $t5, $t6  # soma = A[i] + B [i] 
  sw $t7, 0($t4) # C[i] = soma
  
  subi $t0, $t0, 1  # Diminui o contador n--
  addi $t1, $t1, 4  # Avan�a o endere�o do vetor em uma posi��o
  addi $t2, $t2, 4  # Avan�a o endere�o do vetor em uma posi��o
  addi $t4, $t4, 4  # Avan�a o endere�o do vetor em uma posi��o
  j loop_sub

return:
  jr $ra
  
end:
  j end
  
.data
  # Vetor A
  A: .word 2, -4, 3, -8, 4, 5, 6, 8

  # Vetor B
  B: .word -1, -2, 3, 10, 12, -5, 6, 5

  # Vetor C - Adi��o
  C: .word 0, 0, 0, 0, 0, 0, 0, 0

  # Vetor D - Subtra��o
  D: .word 0, 0, 0, 0, 0, 0, 0, 0

  # Tamanho
  n: .word 8
  
  # Somat�rio dos vetores B e C x Valor m�ximo entre eles
  SM: .word 0
