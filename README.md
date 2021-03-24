# ProcessadorVHDL
Projeto de CPU em VHDL

Descrição do Projeto
Grupos: máximo de 2(dois) integrantes
Realizar o projeto de uma CPU capaz de executar as seguintes instruções:
Instrução Significado Descrição 
MOV   Ri,Rj     Ri <- RjMove
MOV   Ri,Imed   Ri <- Imed
Move Immediate
ADD   Ri,Rj,Rk  Ri <- Rj + RkAdd
ADDI  Ri,Rj,Imed    Ri <- Rj + ImedAdd Immediate
SUB   Ri,Rj,Rk      Ri <- Rj - Rk Subtract
SUBI  Ri,Rj,Imed    Ri <- Rj - ImedSubtract Immediate
AND   Ri,Rj,Rk      Ri <- Rj & RkAnd
ANDI  Ri,Rj,Imed    Ri <- Rj & ImedAnd Immediate
OR    Ri,Rj,Rk      Ri <- Rj | RkOr
ORI   Ri,Rj,Imed    Ri <- Rj | ImedOr Immediate

Onde:Ri, Rj, Rk: registradores de n bits (pertencentes a um banco de registradores. 
Pelo menos 4 registradores de 8 bits cada)
Imed: valor imediatoArquitetura da CPU sugerida: 
Referências:1 – BROWN, Stephen e VRANESIC, Svonko – Fundamentals of Digital Logic with VHDL Design. 2 - PATTERSON, David A. e HENNESSY, John L. – Computer Organization and Design – The Hardware and Software Interface 
Entrega do ProjetoNa data definida deve ser entregue um documento de especificação organizado da seguinte 
forma:
1. Descrição textual do projeto com a topologia da CPU
2. 2. Especificação
3. 2.1 Registradores (quantidade, endereço e tamanho)
4. 2.2 Formato das instruções (OPCODE)
5.3  Unidade  de  Controle:  diagrama  e  tabela  de  estados,  sinais  e  seus significados3. Resultados3.1 Descrição dos testes realizados3.2 Resultados e discussão4. BibliografiaANEXO - Código VHDL produzidoCada integrante do grupo deverá postar na tarefa “Projeto2” no CANVAS:1. O documento de especificação em formato digital (.pdf)2. O código VHDL produzido (.vhd) 3. Os arquivos utilizados na simulação (.vwf)Também  deverão  ser  apresentados  na  data  definida  o  código  VHDL  desenvolvido,  o funcionamento  da  CPU  e  os  testes  realizados  pelos  integrantes  do  grupo  escolhidos  no momento da apresentação. Código de condutaA interação entre os grupos é estimulada, no entanto qualquer tentativa de plágio de trabalhos será punida com a nota -Nmax nos trabalhos para todos os envolvidos.
