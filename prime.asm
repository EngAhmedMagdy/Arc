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
.code
start:


push 50
push offset num
call StdIn

mov eax,txt2dw(offset num)
mov ebx,eax
mov ecx,2d

cmp ebx,1
je _not
cmp ebx,2
je _prime

_loop:
mov eax,ebx
xor edx,edx
div ecx
inc ecx
cmp edx,0
je _not
cmp ecx,ebx
jl _loop

_prime:
printf("%u is prime",ebx)
jmp _exit
_not:
printf("%u is not prime",ebx)
_exit:
    
end start