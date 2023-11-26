.text

  .globl main
main:
  # Armazena os endereços de A, B. C e D
  la $s1, A
  la $s2, B
  la $s3, C
  la $s4, D
  
  # Carrega o tamanho do vetor 
  la $t0, n
  lw $s0, 0($t0)

  # Sub-rotina de adição - Preenche o vetor C
  jal addition
  # Sub-rotina de subtração - Preenche o vetor D
  jal subtraction
  
  # Carrega a variável de resultado
  la $t7, SM
  
  # Sub-rotina de cálculo do somatório dos vetores C e D x o valor máximo entre eles
  jal sum_max
  
  j end
  
# for (int i = n; i > 0; i--) {
#     C[i] = A[i] + B[i];
# }
addition:
  # Endereços temporários
  add $t1, $s1, $zero  # Inicia endereço do vetor A
  add $t2, $s2, $zero  # Inicia endereço do vetor B
  add $t3, $s3, $zero  # Inicia endereço do vetor C
  # Define uma variável para controle do loop
  add $t0, $s0, $zero
loop_add:
  blez $t0, return # Se n <= 0, então sai do loop   
  lw $t5, 0($t1)  # Carrega o conteúdo do vetor A
  lw $t6, 0($t2)  # Carrega o conteúdo do vetor B
  add $t7, $t5, $t6  # soma = A[i] + B [i] 
  sw $t7, 0($t3) # C[i] = soma
  
  subi $t0, $t0, 1  # Diminui o contador n--
  addi $t1, $t1, 4  # Avança o endereço do vetor em uma posição
  addi $t2, $t2, 4  # Avança o endereço do vetor em uma posição
  addi $t3, $t3, 4  # Avança o endereço do vetor em uma posição
  j loop_add
  
# for (int i = n; i > 0; i--) {
#     D[i] = A[i] - B[i];
# }
subtraction:
  # Endereços temporários
  add $t1, $s1, $zero  # Inicia endereço do vetor A
  add $t2, $s2, $zero  # Inicia endereço do vetor B
  add $t4, $s4, $zero  # Inicia endereço do vetor C
  # Define uma variável para controle do loop
  add $t0, $s0, $zero
loop_sub:
  blez $t0, return # Se n <= 0, então sai do loop   
  lw $t5, 0($t1)  # Carrega o conteúdo do vetor A
  lw $t6, 0($t2)  # Carrega o conteúdo do vetor B
  sub $t7, $t5, $t6  # soma = A[i] + B [i] 
  sw $t7, 0($t4) # C[i] = soma
  
  subi $t0, $t0, 1  # Diminui o contador n--
  addi $t1, $t1, 4  # Avança o endereço do vetor em uma posição
  addi $t2, $t2, 4  # Avança o endereço do vetor em uma posição
  addi $t4, $t4, 4  # Avança o endereço do vetor em uma posição
  j loop_sub
  
sum_max:
sum:
  # int sum = 0;
  # for (int i = n; i > 0; i--) {
  #     sum += C[i];
  #     sum += D[i];
  # }
  # Endereços temporários
  add $t3, $s3, $zero  # Inicia endereço do vetor C
  add $t4, $s4, $zero  # Inicia endereço do vetor D
  # Define uma variável para controle do loop
  add $t0, $s0, $zero
  # Variável sum
  add $t9, $zero, $zero 
loop_sum:
  blez $t0, max  # Se n <= 0, então sai do loop e vai para o próximo cálculo 
  lw $t5, 0($t3)  # Carrega o conteúdo do vetor C
  add $t9, $t9, $t5 # sum += C[i]
  lw $t6, 0($t4)  # Carrega o conteúdo do vetor D
  add $t9, $t9, $t6 # sum += D[i]
  
  subi $t0, $t0, 1  # Diminui o contador n--
  addi $t3, $t3, 4  # Avança o endereço do vetor em uma posição
  addi $t4, $t4, 4  # Avança o endereço do vetor em uma posição
  j loop_sum

max:
  # int max = 0;
  # for (int i = n; i > 0; i--) {
  #     if (C[i] > max) max = C[i];
  #     if (D[i] > max) max = D[i];
  # }
  # Endereços temporários
  add $t3, $s3, $zero  # Inicia endereço do vetor C
  add $t4, $s4, $zero  # Inicia endereço do vetor D
  # Define uma variável para controle do loop
  add $t0, $s0, $zero
  # Variável max
  add $t8, $zero, $zero 
loop_max:
  blez $t0, sumxmax  # Se n <= 0, então sai do loop e vai para o próximo cálculo 
  lw $t5, 0($t3)  # Carrega o conteúdo do vetor C
  ble $t5, $t8, elseif
  add $t8, $t5, $zero
elseif:
  lw $t6, 0($t4)  # Carrega o conteúdo do vetor D
  ble $t6, $t8, else
  add $t8, $t6, $zero
else:

  subi $t0, $t0, 1  # Diminui o contador n--
  addi $t3, $t3, 4  # Avança o endereço do vetor em uma posição
  addi $t4, $t4, 4  # Avança o endereço do vetor em uma posição
  j loop_max

sumxmax:
  # int SM = 0;
  # for (int i = max; i > 0; i--) {
  #     SM += sum;
  # }
  # Define uma variável para controle do loop
  add $t0, $t8, $zero
  # Variável SM
  add $s7, $zero, $zero 
loop_sumxmax:
  blez $t0, return  # Se n <= 0, então sai do loop e vai para o próximo cálculo 
  add $s7, $s7, $t9 # SM += sum
  subi $t0, $t0, 1  # Diminui o contador n--
  j loop_sumxmax

return:
  jr $ra
  
end:
  j end
  
.data
  # Vetor A
  A: .word 2, -4, 3, -8, 4, 5, 6, 8
  # Vetor B
  B: .word -1, -2, 3, 10, 12, -5, 6, 5
  # Vetor C - Adição
  C: .word 0, 0, 0, 0, 0, 0, 0, 0
  # Vetor D - Subtração
  D: .word 0, 0, 0, 0, 0, 0, 0, 0
  # Tamanho
  n: .word 8
  # Somatório dos vetores C e D x Valor máximo entre eles
  SM: .word 0