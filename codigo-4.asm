; PROGRAMA 4: Paso de parametros por la pila (stack frame)
; Envia dos numeros por la pila a un procedimiento que los
; multiplica, usando EBP para acceder a los parametros.
; Alumno: Angel Ernesto Santos Plazola
; Docente: Ing. Jose Luis Medina Jimenez

INCLUDE Irvine32.inc

.data
.code
main PROC
    mov ebx, 999 ; ponemos un valor de prueba para ver que no se borre

    ; metemos los dos numeros a la pila para mandarlos al procedimiento
    push 3 
    push 25

    call SumarPila
    nop  ; instruccion vacia, solo para marcar donde regresamos del call
    exit
main ENDP

; Procedimiento que lee de la pila y multiplica
SumarPila PROC 
    ; preparamos el marco de la pila (stack frame)
    push ebp 
    mov ebp, esp 

    push ebx ; guardamos el ebx original para no perder el 999 del main

    ; sacamos los parametros que mandamos desde el main
    mov eax, [ebp + 8]  ; saca el 25
    mov ebx, [ebp + 12] ; saca el 3

    imul eax, ebx ; hacemos la multiplicacion (resultado se queda en EAX)

    ; restauramos los registros para dejar todo como estaba
    pop ebx
    pop ebp

    ret 8 ; regresamos al main y limpiamos los 8 bytes de los dos push (4 bytes cada uno)
SumarPila ENDP
END main