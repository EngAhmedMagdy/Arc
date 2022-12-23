
.386 
.model flat, stdcall 
option casemap :none 
include \masm32\include\masm32rt.inc

txt2dw MACRO sz$
  invoke atodw, reparg(sz$)
  EXITM <eax>
ENDM

.data 

num  dword 50 dup (?)
one dword 1d

.code 
start:
push 50
push offset num
call StdIn

mov ecx,txt2dw(offset num)
mov ebx,ecx
mov eax,1 
_fac:
mul ecx
dec ecx
cmp ecx,1
jg _fac

printf ("factorial of %u = %u",ebx,eax)

end start