.386 
.model flat, stdcall 
option casemap :none 
include \masm32\include\masm32rt.inc

txt2dw MACRO sz$
  invoke atodw, reparg(sz$)
  EXITM <eax>
ENDM

.data
lpBuffer    db 12 dup (?)
tx123	db "12", 0
num  db 50 dup (?)
p db "prime",0
ten dword 10d
.code
start:


push 50
push offset num
call StdIn

mov eax,txt2dw(offset num)
xor ebx,ebx


_loop:
xor edx,edx
div ten
add ebx,edx
cmp eax,0
jg _loop


printf("sum of digits = %u \n",ebx)

_exit:

end start