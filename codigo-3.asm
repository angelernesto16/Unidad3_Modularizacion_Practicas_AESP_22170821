; PROGRAMA 3: Validacion de entrada (etiquetas y CMP)
; Alumno: Angel Ernesto Santos Plazola
; Docente: Ing. Jose Luis Medina Jimenez

INCLUDE Irvine32.inc            

.data
; mensajes que vamos a mostrar dependiendo del resultado
msgValida BYTE "Exito: Entrada valida", 0       
msgInvalida BYTE "Error: Entrada invalida", 0   

.code
main PROC
    ; simulamos que leimos una entrada de 7 letras
    mov ecx, 7                      

entradaInvalida:
    ; bloque para mostrar que salio mal
    mov edx, OFFSET msgInvalida
    call WriteString
    call Crlf

cadenaVacia:
    ; aqui simulamos que el usuario no escribio nada (0 letras)
    mov ecx, 0                      

fin:
    exit
main ENDP

; funcion rapida para checar si la entrada esta vacia
validarNoVacia:                     
    cmp ecx, 0      ; comparamos si los caracteres son 0
    ret                             

END main