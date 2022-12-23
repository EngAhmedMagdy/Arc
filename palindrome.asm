.386 
.model flat, stdcall 
option casemap :none 
include \masm32\include\masm32rt.inc

txt2dw MACRO sz$
  invoke atodw, reparg(sz$)
  EXITM <eax>
ENDM

.data
lpBuffer dword 12 dup(?)
num  db 50 dup (?)
ten dword 10d

.code
start:


push 50
push offset num
call StdIn

mov ebx,txt2dw(offset num)
mov eax,ebx
_loop1:
xor edx,edx
div ten
push edx
cmp eax,0
jg _loop1


mov eax,ebx
_loop2:
xor edx,edx
div ten
pop lpBuffer
cmp edx,lpBuffer
jne _not
cmp eax,0
jg _loop2



_pal:
printf("%u A palindrome",ebx)
jmp _exit
_not:
printf("%u not A palindrome",ebx)

_exit:
    
end start