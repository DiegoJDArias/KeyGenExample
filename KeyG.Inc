include windows.inc
include kernel32.inc
include user32.inc
include shell32.inc
include Comctl32.inc

includelib kernel32.lib
includelib user32.lib
includelib shell32.lib
includelib Comctl32.lib

; /////////////////////////////////////////////////
; Author Diego J D Arias - diegojdarias@gmail.com.
; ///////////////////////////////////////////////


DlgProc			PROTO	:HWND, :UINT, :WPARAM, :LPARAM

.const
    IDD_DIALOG1			equ 101

; ************************************************************************

.data?
    hInstance			dd ?

.data
    nomUsuario          dq 0, 0
    nSerie				dq 0, 0
    
; ************************************************************************
