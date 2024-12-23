.386
.model flat, stdcall  ; 32 bit
option casemap :none  ; Sensible a Mayuscula y Minusculas

; /////////////////////////////////////////////////
; Author Diego J D Arias - diegojdarias@gmail.com.
; ///////////////////////////////////////////////

include KeyG.inc

.code

start:

	invoke GetModuleHandle, NULL
	mov	   hInstance, eax

    invoke InitCommonControls
	invoke DialogBoxParam, hInstance, IDD_DIALOG1, NULL, addr DlgProc, NULL
	invoke ExitProcess, 0

; ********************************************************************

DlgProc proc hWin:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM

    mov	   eax, uMsg
    .if eax == WM_INITDIALOG

    .elseif eax == WM_COMMAND
	    	mov    eax, wParam
            .if eax == 1003
                call    borrar
                invoke GetDlgItemText, hWin, 1001, ADDR nomUsuario, 10
                call    generarSerial
                invoke SetDlgItemText, hWin, 1002, offset nSerie
            .elseif eax == 1004
                invoke EndDialog, hWin, 0
            .endif

    .elseif eax == WM_CLOSE
	    invoke EndDialog, hWin, 0
    .else
	    mov	   eax, FALSE
	    ret
    .endif
    
    mov	   eax, TRUE
    ret

DlgProc endp

borrar:
    push   edi
    mov    edi, offset nomUsuario
    xor    eax, eax
    mov    ecx, 8
    rep    stosd
    pop    edi
    ret

generarSerial:
invoke lstrlen, offset nomUsuario
    xor    edx, edx
    xor    ecx, ecx
    
continuar:
	mov     dl, byte ptr[nomUsuario+ecx]
	add     dl, 2
	add     dl, 4
	mov     byte ptr[nSerie+ecx], dl
	inc     ecx
	.if ecx != eax
		jmp    continuar
	.endif
    ret
end start
