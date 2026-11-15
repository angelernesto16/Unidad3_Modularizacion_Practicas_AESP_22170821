; PROGRAMA 2: Lectura de cadenas con ReadString (buffer)
; Pide el nombre al usuario, lo guarda en un buffer, lo muestra
; y despues imprime el numero de caracteres escritos.
; Alumno: Angel Ernesto Santos Plazola
; Docente: Ing. Jose Luis Medina Jimenez

INCLUDE Irvine32.inc            

.data
mensajeEntrada BYTE "Escribe tu nombre: ",0
caracteresEscritos BYTE "Numero de caracteres: ",0
nombre BYTE 20 DUP(0)   ; reservamos 20 espacios para guardar el nombre

.code
main PROC
    ; pedimos el nombre al usuario
    mov edx, OFFSET mensajeEntrada
    call WriteString

    ; preparamos todo para guardar lo que se escriba
    mov edx, OFFSET nombre
    mov ecx, SIZEOF nombre 

    ; leemos del teclado (la cantidad de letras leidas se guarda en EAX)
    call ReadString
    call Crlf

    ; imprimimos el nombre que acabamos de capturar
    mov edx, OFFSET nombre
    call WriteString
    call Crlf                       
    
    ; mostramos el total de letras (WriteDec imprime lo que haya en EAX)
    mov edx, OFFSET caracteresEscritos 
    call WriteString
    call WriteDec

    exit                            
main ENDP

END main