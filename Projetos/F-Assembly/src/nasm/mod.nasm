; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide o número posicionado na RAM[1] pelo número posicionado no RAM[2] e armazena o resultado na RAM[0].

leaw $R1,%A
movw (%A),%D


WHILE:
leaw $R2,%A
subw %D,(%A),%S
movw %S,%D
leaw $WHILE,%A
jg %S
nop

IF:
leaw $FINAL,%A
je %S
nop

leaw $R2,%A
addw %D,(%A),%S

FINAL:
leaw $R0, %A
movw %S, (%A)