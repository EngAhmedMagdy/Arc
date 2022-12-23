.386 
.model flat, stdcall 
option casemap :none 
include \masm32\include\masm32rt.inc

txt2dw MACRO sz$
  invoke atodw, reparg(sz$)
  EXITM <eax>
ENDM

.data
num db 50 dup(?)
.code
start:


push 50
push offset num
call StdIn


mov eax,txt2dw(offset num)
xor edx,edx
mov ebx,2d
div ebx

cmp edx,0d
je _even
printf("number is odd ")
jmp _exit
_even:
printf("number is even ")
_exit:





end start

 