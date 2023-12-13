# ArrayManipulationInAssembly
Nome: Bernardo Nilson
Orientador: Prof. Edson Moreno

## Orientações Gerais

O objetivo deste trabalho é exercitar e consolidar a compreensão dos alunos sobre programação em linguagem assembly focando na manipulação de vetores. Os alunos desenvolverão as habilidades de carregar, armazenar, manipular e processar vetores usando técnicas de programação em linguagem assembly.

a) O trabalho pode ser desenvolvido individualmente ou em duplas.
O número da especificação do trabalho a ser realizado é definido pelo resultado do resto da divisão por 10 da soma dos dígitos menos significativo da matrícula (sem dígito verificador) dos alunos que compõe a dupla:

> 0 - 1 - 2: e specificação 1
> 3 - 4 - 5 : especificação 2
> 6 - 7 - 8 - 9 : especificação 3

b) Entregar um arquivo em formato zip , nomeando-o nomeAluno1_nomeAluno2.zip , com 3 arquivos : `relatório.pdf` , `tp_GERAL.asm` e `tp_nro.asm`.

c) Em hipótese alguma serão aceitos códigos fontes e/ou demais elementos plagiados. Em caso de ocorrência desta grave infração, a nota de todos os alunos envolvidos será sumariamente zerada.

## Avaliação

### Parte 1 - [ 4 pontos]

Relatório ( relatório.pdf ), contendo 5 seções:

(1) [1 ponto] pseudocódigo ou código (Python, C, Java...) do programa, explicando o mesmo;

(2) [ 1 ponto] uma tabela que relacione as principais variáveis do pseudocódigo/código com os registradores da arquitetura MIPS;

(3) [ 1 ponto] um exemplo da área de dados ( diferente da apresentada ), com a solução esperada;

(4) [1 ponto] telas capturadas do simulador MARS, com explicação do que a tela apresenta;

### Parte 2 - [ 6 pontos]

Código em linguagem assembly , com comentários e corretamente indentado , usando apenas o conjunto de instruções visto em aula. Apresentar no relatório (seção 4) figuras da área de dados conforme exemplo apresentado posteriormente, correspondendo aos dados selecionados pelos alunos.

## ESPECIFICAÇÕES DO TP

**ESPECIFICAÇÃO GERAL** (para todos os alunos):

1. Crie dois vetores unidimensionais, A e B, cada um consistindo de n (onde n >= **8** ) inteiros aleatórios com sinal **(devem ser utilizados** pelo menos 2 valores positivos e 2 valores negativos).

2. Crie dois vetores C e D com o mesmo número de elementos (n) dos vetores A e B. Todas as posições dos vetores C e D devem ser inicializados com zero.

3. **Adição de Vetores** - 𝐶(𝑖)=𝐴(𝑖) + 𝐵(𝑖)

    a. Crie uma sub-rotina em linguagem assembly que realize a adição de vetores.
    b. A sub-rotina deve receber os vetores de entrada A e B e armazenar o resultado em um novo vetor C.
    c. Use estruturas de looping apropriadas para iterar pelos vetores.

4. **Subtração de Vetores** - 𝐷(𝑖)= 𝐴(𝑖)− 𝐵(𝑖)

    a. Crie uma sub-rotina em linguagem assembly que realize a subtração de vetores.
    b. A sub-rotina deve receber os vetores de entrada A e B e armazenar o resultado em um novo vetor D.
    c. Use estruturas de looping apropriadas para iterar pelos vetores.

5. Siga para a **ESPECIFICAÇÃO** adequada ao **menor** dígito final da matrícula.

**ESPECIFICAÇÃO 3** (para dígitos finais da matrícula **6 - 7 - 8 - 9** ):

1. Crie uma sub-rotina que calcule o **somatório de dois vetores multiplicado pelo valor máximo deles** ( _SM_ → _máximo vezes_

𝑆𝑀 = max(𝐶,𝐷) . (∑𝐶𝑛+ ∑𝐷𝑛) = max(𝐶,𝐷) . (𝐶0 + 𝐶1 + 𝐶2 + ⋯ + 𝐶𝑛−1 + 𝐷0 + 𝐷1 + 𝐷2 + ⋯ + 𝐷𝑛−1)

2. Calcule o **somatório dos vetores C e D,** que foram obtidos na ESPECIFICAÇÃO GERAL, **multiplicado pelo valor máximo deles**.
3. Salve o resultado em uma variável ( **SM** ) na memória.

```
Exemplo:
```
- Considerando: 𝐶 = { 10 , 20 ,− 5 , 30 } 𝐷 = { 2 , 3 , 4 ,− 8 }
- 𝑆𝑀 = 30 .(( 10 + 20 +(− 5 )+ 30 )+( 2 + 3 + 4 +(− 8 ))= 30 ( 56 )=𝟏𝟔𝟖𝟎
###### }



