; PROGRAMA 5: Macro de reemplazo de texto (MostrarMensaje)
; Define una macro para imprimir mensajes y la invoca dos veces.
; Alumno: Angel Ernesto Santos Plazola
; Docente: Ing. Jose Luis Medina Jimenez

INCLUDE Irvine32.inc            

; definimos la macro, que nos sirve como plantilla para no escribir estas 3 lineas a cada rato
MostrarMensaje MACRO texto      
    mov edx, OFFSET texto       ; pasamos la variable que recibimos al registro EDX
    call WriteString            ; imprimimos
    call Crlf                   ; damos un enter
ENDM                            

.data
; variables con los textos que vamos a usar
mensajeInicio BYTE "Bienvenidos a tu salon favorito", 0 
mensajeFin  BYTE "Nos vemos vuelva pronto",  0           

.code
main PROC

    ; usamos la macro pasandole el primer mensaje (el ensamblador pegara el codigo aqui)
    MostrarMensaje mensajeInicio    
    
    ; la volvemos a reutilizar pero ahora con el mensaje de despedida
    MostrarMensaje mensajeFin       
    
    exit
main ENDP
END main