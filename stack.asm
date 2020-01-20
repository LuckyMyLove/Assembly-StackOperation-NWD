global nwd
global print_sp
extern printf
section .data

str: db "sp=%lu",10,0

section .text

nwd:
call print_sp
cmp esi,0
jz koniec_nwd
mov eax,edi
xor edx,edx

div esi
mov edi,esi
mov esi,edx
call nwd

koniec_nwd:
mov eax,edi
call print_sp
ret

print_sp:
push rax
push rdi
push rsi
mov rdi,str
mov rsi,rsp
add rsi,32    
xor eax, eax
call printf wrt ..plt
pop rsi
pop rdi
pop rax
ret
