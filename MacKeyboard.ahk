#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook

; ==========================================================
; MAC KEYBOARD FOR WINDOWS
; AutoHotkey v2
; ==========================================================
;
; Left Command  ⌘ = Command estilo macOS
; Right Command ⌘ = Windows nativo
; Option        ⌥ = Alt nativo
; Control       ⌃ = Ctrl nativo
;
; ==========================================================


; ==========================================================
; LEFT COMMAND
; ==========================================================
;
; Bloqueamos únicamente LWin.
; Windows nunca recibe Left Command como Win.
;
; Right Command queda intacto y funciona como Win real.
;

*LWin::Return
*LWin Up::Return


; ==========================================================
; TODO LO QUE SIGUE SOLO FUNCIONA MIENTRAS
; LEFT COMMAND ESTÁ FÍSICAMENTE PRESIONADO
; ==========================================================

#HotIf GetKeyState("LWin", "P")


; ==========================================================
; COMMAND → CTRL
; ATAJOS GENERALES
; ==========================================================

$a::Send "^a"
$b::Send "^b"
$c::Send "^c"
$d::Send "^d"
$e::Send "^e"
$f::Send "^f"
$g::Send "^g"
$h::Send "^h"
$i::Send "^i"
$j::Send "^j"
$k::Send "^k"
$l::Send "^l"

; M es excepción más abajo

$n::Send "^n"
$o::Send "^o"
$p::Send "^p"

; Q es excepción más abajo

$r::Send "^r"
$s::Send "^s"
$t::Send "^t"
$u::Send "^u"
$v::Send "^v"
$w::Send "^w"
$x::Send "^x"
$y::Send "^y"
$z::Send "^z"


; ==========================================================
; COMMAND + SHIFT
; ==========================================================
;
; Para combinaciones propias de aplicaciones.
;

$+a::Send "^+a"
$+b::Send "^+b"
$+c::Send "^+c"
$+d::Send "^+d"
$+e::Send "^+e"
$+f::Send "^+f"
$+g::Send "^+g"
$+h::Send "^+h"
$+i::Send "^+i"
$+j::Send "^+j"
$+k::Send "^+k"
$+l::Send "^+l"
$+m::Send "^+m"

; Cmd + Shift + N tiene comportamiento habitual de Ctrl+Shift+N
$+n::Send "^+n"

$+o::Send "^+o"
$+p::Send "^+p"
$+q::Send "^+q"
$+r::Send "^+r"
$+s::Send "^+s"

; Cmd + Shift + T = reabrir pestaña
$+t::Send "^+t"

$+u::Send "^+u"
$+v::Send "^+v"
$+w::Send "^+w"
$+x::Send "^+x"
$+y::Send "^+y"

; macOS: Cmd + Shift + Z = rehacer
$+z::Send "^y"


; ==========================================================
; COMMAND + NÚMEROS
; ==========================================================

$1::Send "^1"
$2::Send "^2"
$3::Send "^3"
$4::Send "^4"
$5::Send "^5"
$6::Send "^6"
$7::Send "^7"
$8::Send "^8"
$9::Send "^9"

$0::Send "^0"


; ==========================================================
; ZOOM
; ==========================================================

$-::Send "^-"
$=::Send "^="


; ==========================================================
; EXCEPCIONES MAC
; ==========================================================

; Cmd + Q
; Cerrar ventana/aplicación
$q::Send "!{F4}"


; Cmd + M
; Minimizar ventana actual
$m::WinMinimize "A"


; ==========================================================
; COMMAND + FLECHAS
; ==========================================================

; Inicio / final de línea
$Left::Send "{Home}"
$Right::Send "{End}"

; Inicio / final del documento
$Up::Send "^{Home}"
$Down::Send "^{End}"


; ==========================================================
; COMMAND + SHIFT + FLECHAS
; ==========================================================

; Seleccionar hasta inicio / final de línea
$+Left::Send "+{Home}"
$+Right::Send "+{End}"

; Seleccionar hasta inicio / final del documento
$+Up::Send "^+{Home}"
$+Down::Send "^+{End}"


; ==========================================================
; COMMAND + BACKSPACE
; ==========================================================

; Borrar hasta el inicio de la línea

$Backspace::
{
    Send "+{Home}"
    Send "{Backspace}"
}


; ==========================================================
; PESTAÑAS
; ==========================================================

; Cmd + Shift + [
; pestaña anterior
$+[::Send "^+{Tab}"

; Cmd + Shift + ]
; pestaña siguiente
$+]::Send "^{Tab}"


; ==========================================================
; ATRÁS / ADELANTE
; ==========================================================

; Cmd + [
$[::Send "!{Left}"

; Cmd + ]
$]::Send "!{Right}"


; ==========================================================
; SCREENSHOTS TIPO macOS
; ==========================================================

; Cmd + Shift + 3
; Pantalla completa
$+3::Send "#{PrintScreen}"


; Cmd + Shift + 4
; Selección de área
$+4::Send "#+s"


; Cmd + Shift + 5
; Snipping Tool
$+5::Run "snippingtool.exe"


; ==========================================================
; TERMINA EL MODO COMMAND
; ==========================================================

#HotIf


; ==========================================================
; OPTION
; ==========================================================
;
; Option continúa siendo Alt real de Windows.
;
; Esto significa:
;
; Option + Tab = Alt + Tab nativo
;
; ==========================================================


; Option + izquierda/derecha
; Moverse por palabras

!Left::Send "^{Left}"
!Right::Send "^{Right}"


; Option + Shift + izquierda/derecha
; Seleccionar por palabras

!+Left::Send "^+{Left}"
!+Right::Send "^+{Right}"


; Option + Backspace
; Borrar palabra anterior

!Backspace::Send "^{Backspace}"
