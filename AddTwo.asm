; PROGRAMA 1: Procedimientos (CALL y RET)
; Muestra como llamar un procedimiento dos veces y regresar
; al punto exacto despues de cada llamada.
; Alumno: Santos Plazola Angel Ernesto
; Docente: Jose Luis Medina Jimenez

INCLUDE Irvine32.inc

.data
    ; variables con los mensajes a imprimir
    mensajeInicio BYTE "Incio de programa", 0
    mensajeProcedimiento BYTE "Estoy dentro del procedimiento", 0
    mensajeFin BYTE "Fin del programa", 0 
.code
main PROC
    ; imprimimos el mensaje de inicio
    mov edx, OFFSET mensajeInicio
    call WriteString
    call Crlf

    ; primera llamada a la funcion
    call mostrarAviso

    mov eax, 10

    ; segunda llamada
    call mostrarAviso
    mov eax, 20

    ; imprimimos el mensaje de fin
    mov edx, OFFSET mensajeFin
    call WriteString
    call Crlf
main ENDP

; Funcion que solo imprime un texto y se regresa
mostrarAviso PROC
    mov edx, OFFSET mensajeProcedimiento
    call WriteString
    call Crlf
    ret ; regresamos al main justo donde nos quedamos
mostrarAviso ENDP
END main