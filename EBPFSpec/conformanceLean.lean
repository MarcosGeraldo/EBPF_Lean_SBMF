import «EBPFSpec».TestFunctions

-- Start of file: add.lean
------------------------------

def memoryadd :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progadd : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov32 %r1, 2
add32 %r0, 1
add32 %r0, %r1
add32 %r0, %r0
add32 %r0, -3
exit
result
0x3
}
-- End of file: add.lean

-- Start of file: add64.lean
------------------------------

def memoryadd64 :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progadd64 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0
mov %r1, 2
add %r0, 1
add %r0, %r1
add %r0, %r0
add %r0, -3
exit
result
0x3
}
-- End of file: add64.lean

-- Start of file: alu-arith.lean
------------------------------

def memoryalu_arith :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progalu_arith : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 10
sub32 %r0, %r0
mov32 %r1, 1
mov32 %r2, 2
mov32 %r3, 3
mov32 %r4, 4
mov32 %r5, 5
mov32 %r6, 6
mov32 %r7, 7
mov32 %r8, 8
mov32 %r9, 9
jne %r0, 0, exit
add32 %r0, 23
add32 %r0, %r7
jne %r0, 30, exit
sub32 %r0, 13
sub32 %r0, %r1
jne %r0, 16, exit
mul32 %r0, 7
mul32 %r0, %r3
jne %r0, 336, exit
div32 %r0, 2
div32 %r0, %r4
jne %r0, 42, exit
exit
result
0x2a
}
-- End of file: alu-arith.lean

-- Start of file: alu-bit.lean
------------------------------

def memoryalu_bit :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progalu_bit : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov32 %r1, 1
mov32 %r2, 2
mov32 %r3, 3
mov32 %r4, 4
mov32 %r5, 5
mov32 %r6, 6
mov32 %r7, 7
mov32 %r8, 8
jne %r0, 0, exit
or32 %r0, %r5
or32 %r0, 0xa0
or32 %r0, %r0
jne %r0, 0xa5, exit
and32 %r0, 0xa3
mov32 %r9, 0x91
and32 %r0, %r9
and32 %r0, %r0
jne %r0, 0x81, exit
lsh32 %r0, 22
lsh32 %r0, %r8
jne %r0, 0x40000000, exit
rsh32 %r0, 19
rsh32 %r0, %r7
jne %r0, 0x10, exit
xor32 %r0, 0x03
xor32 %r0, %r2
exit
result
0x11
}
-- End of file: alu-bit.lean

-- Start of file: alu64-arith.lean
------------------------------

def memoryalu64_arith :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progalu64_arith : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 10
sub %r0, %r0
mov %r1, 1
mov %r2, 2
mov %r3, 3
mov %r4, 4
mov %r5, 5
mov %r6, 6
mov %r7, 7
mov %r8, 8
mov %r9, 9
jne %r0, 0, exit
add %r0, 23
add %r0, %r7
jne %r0, 30, exit
sub %r0, 13
sub %r0, %r1
jne %r0, 16, exit
mul %r0, 7
mul %r0, %r3
jne %r0, 336, exit
div %r0, 2
div %r0, %r4
exit
result
0x2a
}
-- End of file: alu64-arith.lean

-- Start of file: alu64-bit.lean
------------------------------

def memoryalu64_bit :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progalu64_bit : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0
mov %r1, 1
mov %r2, 2
mov %r3, 3
mov %r4, 4
mov %r5, 5
mov %r6, 6
mov %r7, 7
mov %r8, 8
jne %r0, 0, exit
or %r0, %r5
or %r0, 0xa0
or %r0, %r0
jne %r0, 0xa5, exit
and %r0, 0xa3
mov %r9, 0x91
and %r0, %r9
and %r0, %r0
jne %r0, 0x81, exit
lsh %r0, 32
lsh %r0, 22
lsh %r0, %r8
rsh %r0, 32
rsh %r0, 19
rsh %r0, %r7
jne %r0, 0x10, exit
xor %r0, 0x03
xor %r0, %r2
exit
result
0x11
}
-- End of file: alu64-bit.lean

-- Start of file: arsh32-imm-high.lean
------------------------------

def memoryarsh32_imm_high :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progarsh32_imm_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0xf8
lsh32 %r0, 28
arsh32 %r0, 48
exit
result
0xffff8000
}
-- End of file: arsh32-imm-high.lean

-- Start of file: arsh32-imm-neg.lean
------------------------------

def memoryarsh32_imm_neg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progarsh32_imm_neg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0xf8
lsh32 %r0, 28
arsh32 %r0, -16
exit
result
0xffff8000
}
-- End of file: arsh32-imm-neg.lean

-- Start of file: arsh32-imm.lean
------------------------------

def memoryarsh32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progarsh32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0xf8
lsh32 %r0, 28
arsh32 %r0, 16
exit
result
0xffff8000
}
-- End of file: arsh32-imm.lean

-- Start of file: arsh32-reg-high.lean
------------------------------

def memoryarsh32_reg_high :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progarsh32_reg_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0xf8
mov32 %r1, 48
lsh32 %r0, 28
arsh32 %r0, %r1
exit
result
0xffff8000
}
-- End of file: arsh32-reg-high.lean

-- Start of file: arsh32-reg-neg.lean
------------------------------

def memoryarsh32_reg_neg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progarsh32_reg_neg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0xf8
mov32 %r1, -16
lsh32 %r0, 28
arsh32 %r0, %r1
exit
result
0xffff8000
}
-- End of file: arsh32-reg-neg.lean

-- Start of file: arsh32-reg.lean
------------------------------

def memoryarsh32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progarsh32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0xf8
mov32 %r1, 16
lsh32 %r0, 28
arsh32 %r0, %r1
exit
result
0xffff8000
}
-- End of file: arsh32-reg.lean

-- Start of file: arsh64-imm-high.lean
------------------------------

def memoryarsh64_imm_high :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progarsh64_imm_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
lsh %r0, 63
arsh %r0, 124
exit
result
0xfffffffffffffff8
}
-- End of file: arsh64-imm-high.lean

-- Start of file: arsh64-imm-neg.lean
------------------------------

def memoryarsh64_imm_neg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progarsh64_imm_neg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
lsh %r0, 63
arsh %r0, -4
exit
result
0xfffffffffffffff8
}
-- End of file: arsh64-imm-neg.lean

-- Start of file: arsh64-imm.lean
------------------------------

def memoryarsh64_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progarsh64_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
lsh %r0, 63
arsh %r0, 60
exit
result
0xfffffffffffffff8
}
-- End of file: arsh64-imm.lean

-- Start of file: arsh64-reg-high.lean
------------------------------

def memoryarsh64_reg_high :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progarsh64_reg_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
lsh %r0, 63
mov32 %r1, 124
arsh %r0, %r1
exit
result
0xfffffffffffffff8
}
-- End of file: arsh64-reg-high.lean

-- Start of file: arsh64-reg-neg.lean
------------------------------

def memoryarsh64_reg_neg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progarsh64_reg_neg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
lsh %r0, 63
mov32 %r1, -4
arsh %r0, %r1
exit
result
0xfffffffffffffff8
}
-- End of file: arsh64-reg-neg.lean

-- Start of file: arsh64-reg.lean
------------------------------

def memoryarsh64_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progarsh64_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
lsh %r0, 63
mov32 %r1, 60
arsh %r0, %r1
exit
result
0xfffffffffffffff8
}
-- End of file: arsh64-reg.lean

-- Start of file: be16-high.lean
------------------------------

def memorybe16_high :=
createStackMemory 0 emptyMemory
{mem|
'1' '1' '2' '2' '3' '3' '4' '4' '5' '5' '6' '6' '7' '7' '8' '8' }
def memorybe16_highAux := createStackMemoryCharList 0 emptyMemory ['1', '1', '2', '2', '3', '3' ,'4', '4', '5', '5', '6', '6', '7', '7' ,'8' ,'8']
def progbe16_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1]
be16 %r0
exit
result
0x1122
}
-- End of file: be16-high.lean

-- Start of file: be16.lean
------------------------------

def memorybe16 :=
createStackMemory 0 emptyMemory
{mem|
'1' '1' '2' '2' }
def progbe16 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxh %r0, [%r1]
be16 %r0
exit
result
0x1122
}
-- End of file: be16.lean

-- Start of file: be32-high.lean
------------------------------

def memorybe32_high :=
createStackMemory 0 emptyMemory
{mem|
'1' '1' '2' '2' '3' '3' '4' '4' '5' '5' '6' '6' '7' '7' '8' '8' }
def progbe32_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1]
be32 %r0
exit
result
0x11223344
}
-- End of file: be32-high.lean

-- Start of file: be32.lean
------------------------------

def memorybe32 :=
createStackMemory 0 emptyMemory
{mem|
'1' '1' '2' '2' '3' '3' '4' '4' }
def progbe32 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxw %r0, [%r1]
be32 %r0
exit
result
0x11223344
}
-- End of file: be32.lean

-- Start of file: be64.lean
------------------------------

def memorybe64 :=
createStackMemory 0 emptyMemory
{mem|
'1' '1' '2' '2' '3' '3' '4' '4' '5' '5' '6' '6' '7' '7' '8' '8' }
def progbe64 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1]
be64 %r0
exit
result
0x1122334455667788
}
-- End of file: be64.lean

-- Start of file: callx.lean
------------------------------

def memorycallx :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progcallx : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r1, -1
mov %r2, 5
call %r2
mov %r0, 2
exit
result
0x2
}
-- End of file: callx.lean

-- Start of file: call_local.lean
------------------------------

def memorycall_local :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progcall_local : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0
mov %r1, 1
mov %r2, 2
mov %r3, 3
mov %r4, 4
mov %r5, 5
mov %r6, 6
mov %r7, 7
mov %r8, 8
mov %r9, 9
call local 10
jne %r0, 15, 6
jne %r6, 6, 5
jne %r7, 7, 4
jne %r8, 8, 3
jne %r9, 9, 2
mov %r0, 1
exit
mov %r0, -1
exit
mov %r0, 0
add %r0, %r1
add %r0, %r2
add %r0, %r3
add %r0, %r4
add %r0, %r5
mov %r6, 0
mov %r7, 0
mov %r8, 0
mov %r9, 0
exit
result
0x1
}
-- End of file: call_local.lean

-- Start of file: call_unwind_fail.lean
------------------------------

def memorycall_unwind_fail :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progcall_unwind_fail : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r1, -1
call 5
mov %r0, 2
exit
result
0x2
}
-- End of file: call_unwind_fail.lean

-- Start of file: div32-by-zero-reg-2.lean
------------------------------

def memorydiv32_zero_reg_2 :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progdiv32_zero_reg_2 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
lddw %r1, 0x100000000
div32 %r0, %r1
exit
result
0x0
}
-- End of file: div32-by-zero-reg-2.lean

-- Start of file: div32-by-zero-reg.lean
------------------------------

def memorydiv32_zero_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progdiv32_zero_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
mov32 %r1, 0
div32 %r0, %r1
exit
result
0x0
}
-- End of file: div32-by-zero-reg.lean

-- Start of file: div32-high-divisor.lean
------------------------------

def memorydiv32_high_divisor :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progdiv32_high_divisor : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 12
lddw %r1, 0x100000004
div32 %r0, %r1
exit
result
0x3
}
-- End of file: div32-high-divisor.lean

-- Start of file: div32-imm.lean
------------------------------

def memorydiv32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progdiv32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r0, 0x10000000c
div32 %r0, 4
exit
result
0x3
}
-- End of file: div32-imm.lean

-- Start of file: div32-reg.lean
------------------------------

def memorydiv32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progdiv32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r0, 0x10000000c
mov %r1, 4
div32 %r0, %r1
exit
result
0x3
}
-- End of file: div32-reg.lean

-- Start of file: div64-by-zero-reg.lean
------------------------------

def memorydiv64_zero_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progdiv64_zero_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
mov32 %r1, 0
div %r0, %r1
exit
result
0x0
}
-- End of file: div64-by-zero-reg.lean

-- Start of file: div64-imm.lean
------------------------------

def memorydiv64_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progdiv64_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0xc
lsh %r0, 32
div %r0, 4
exit
result
0x300000000
}
-- End of file: div64-imm.lean

-- Start of file: div64-negative-imm.lean
------------------------------

def memorydiv64_negative_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progdiv64_negative_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r0, 0xFFFFFFFFFFFFFFFF
div %r0, -10
exit
result
0x1
}
-- End of file: div64-negative-imm.lean

-- Start of file: div64-negative-reg.lean
------------------------------

def memorydiv64_negative_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progdiv64_negative_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r0, 0xFFFFFFFFFFFFFFFF
mov32 %r1, -10
div %r0, %r1
exit
result
0x10000000A
}
-- End of file: div64-negative-reg.lean

-- Start of file: div64-reg.lean
------------------------------

def memorydiv64_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progdiv64_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0xc
lsh %r0, 32
mov %r1, 4
div %r0, %r1
exit
result
0x300000000
}
-- End of file: div64-reg.lean

-- Start of file: exit-not-last.lean
------------------------------

def memoryexit_not_last :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progexit_not_last : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r1, 0
ja 3
mov %r2, 0
exit
mov %r0, 0
ja -6
result
0x0
}
-- End of file: exit-not-last.lean

-- Start of file: exit.lean
------------------------------

def memoryexit :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progexit : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0
exit
result
0x0
}
-- End of file: exit.lean

-- Start of file: j-signed-imm.lean
------------------------------

def memoryj_signed_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progj_signed_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 2
lddw %r1, 0xFFFFFFFF80000000
jeq %r1, 0x80000000, +1
exit
lddw %r1, 0xFFFFFFFF80000000
jlt %r1, 0x80000001, +1
exit
lddw %r1, 0xFFFFFFFF80000001
jgt %r1, 0x80000000, +1
exit
lddw %r1, 0x80000000
jne %r1, 0x80000000, +1
exit
lddw %r1, 0xFFFFFFFF00000000
jset %r1, 0x80000000, +1
exit
mov32 %r0, 1
exit
result
0x1
}
-- End of file: j-signed-imm.lean

-- Start of file: ja32.lean
------------------------------

def memoryja32 :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progja32 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r1, 0
ja32 3
mov %r2, 0
exit
mov %r0, 0
ja32 -6
result
0x0
}
-- End of file: ja32.lean

-- Start of file: jeq-imm.lean
------------------------------

def memoryjeq_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjeq_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov32 %r1, 0xa
jeq %r1, 0xb, exit
mov32 %r0, 1
mov32 %r1, 0xb
jeq %r1, 0xb, exit
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jeq-imm.lean

-- Start of file: jeq-reg.lean
------------------------------

def memoryjeq_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjeq_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov32 %r1, 0xa
mov32 %r2, 0xb
jeq %r1, %r2, exit
jeq %r1, %r1, +1
exit
mov32 %r0, 1
mov32 %r1, 0xb
jeq %r1, %r2, exit
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jeq-reg.lean

-- Start of file: jeq32-imm.lean
------------------------------

def memoryjeq32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjeq32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0x0
mov32 %r1, 0xa
jeq32 %r1, 0xb, exit
mov32 %r0, 1
mov %r1, 0xb
or %r1, %r9
jeq32 %r1, 0xb, exit
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jeq32-imm.lean

-- Start of file: jeq32-reg.lean
------------------------------

def memoryjeq32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjeq32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0xa
mov32 %r2, 0xb
jeq32 %r1, %r2, exit
jeq32 %r1, %r1, +1
exit
mov32 %r0, 1
mov32 %r1, 0xb
or %r1, %r9
jeq32 %r1, %r2, exit
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jeq32-reg.lean

-- Start of file: jge-imm.lean
------------------------------

def memoryjge_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjge_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov32 %r1, 0xa
jge %r1, 0xb, exit
mov32 %r0, 1
mov32 %r1, 0xc
jge %r1, 0xb, exit
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jge-imm.lean

-- Start of file: jge-reg.lean
------------------------------

def memoryjge_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjge_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov32 %r1, 0xa
mov32 %r2, 0x0b
jge %r1, %r2, exit
jge %r1, %r1, +1
exit
mov32 %r0, 1
mov32 %r1, 0xc
jge %r1, %r2, exit
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jge-reg.lean

-- Start of file: jge32-imm.lean
------------------------------

def memoryjge32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjge32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0xa
jge32 %r1, 0xb, exit
mov32 %r0, 1
mov32 %r1, 0xc
or %r1, %r9
jge32 %r1, 0xb, exit
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jge32-imm.lean

-- Start of file: jge32-reg.lean
------------------------------

def memoryjge32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjge32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0xa
mov32 %r2, 0xb
jge32 %r1, %r2, exit
jge32 %r1, %r1, +1
exit
mov32 %r0, 1
mov32 %r1, 0xc
or %r1, %r9
jge32 %r1, %r2, exit
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jge32-reg.lean

-- Start of file: jgt-imm.lean
------------------------------

def memoryjgt_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjgt_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov32 %r1, 5
jgt %r1, 6, exit
jgt %r1, 5, exit
jgt %r1, 4, 1
exit
mov32 %r0, 1
exit
result
0x1
}
-- End of file: jgt-imm.lean

-- Start of file: jgt-reg.lean
------------------------------

def memoryjgt_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjgt_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0
mov %r1, 5
mov %r2, 6
mov %r3, 4
jgt %r1, %r2, exit
jgt %r1, %r1, exit
jgt %r1, %r3, 1
exit
mov %r0, 1
exit
result
0x1
}
-- End of file: jgt-reg.lean

-- Start of file: jgt32-imm.lean
------------------------------

def memoryjgt32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjgt32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 5
or %r1, %r9
jgt32 %r1, 6, exit
jgt32 %r1, 5, exit
jgt32 %r1, 4, 1
exit
mov32 %r0, 1
exit
result
0x1
}
-- End of file: jgt32-imm.lean

-- Start of file: jgt32-reg.lean
------------------------------

def memoryjgt32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjgt32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov %r0, 0
mov %r1, 5
mov32 %r1, 5
or %r1, %r9
mov %r2, 6
mov %r3, 4
jgt32 %r1, %r2, exit
jgt32 %r1, %r1, exit
jgt32 %r1, %r3, 1
exit
mov %r0, 1
exit
result
0x1
}
-- End of file: jgt32-reg.lean

-- Start of file: jit-bounce.lean
------------------------------

def memoryjit_bounce :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjit_bounce : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 1
mov %r6, %r0
mov %r7, %r6
mov %r8, %r7
mov %r9, %r8
mov %r0, %r9
exit
result
0x1
}
-- End of file: jit-bounce.lean

-- Start of file: jle-imm.lean
------------------------------

def memoryjle_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjle_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov32 %r1, 5
jle %r1, 4, exit
jle %r1, 6, +1
exit
jle %r1, 5, +1
exit
mov32 %r0, 1
exit
result
0x1
}
-- End of file: jle-imm.lean

-- Start of file: jle-reg.lean
------------------------------

def memoryjle_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjle_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0
mov %r1, 5
mov %r2, 4
mov %r3, 6
jle %r1, %r2, exit
jle %r1, %r1, +1
exit
jle %r1, %r3, +1
exit
mov %r0, 1
exit
result
0x1
}
-- End of file: jle-reg.lean

-- Start of file: jle32-imm.lean
------------------------------

def memoryjle32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjle32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 5
or %r1, %r9
jle32 %r1, 4, exit
jle32 %r1, 6, +1
exit
jle32 %r1, 5, +1
exit
mov32 %r0, 1
exit
result
0x1
}
-- End of file: jle32-imm.lean

-- Start of file: jle32-reg.lean
------------------------------

def memoryjle32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjle32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov %r0, 0
mov %r1, 5
mov %r2, 4
mov %r3, 6
or %r1, %r9
jle32 %r1, %r2, exit
jle32 %r1, %r1, +1
exit
jle32 %r1, %r3, +1
exit
mov %r0, 1
exit
result
0x1
}
-- End of file: jle32-reg.lean

-- Start of file: jlt-imm.lean
------------------------------

def memoryjlt_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjlt_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov32 %r1, 5
jlt %r1, 4, exit
jlt %r1, 5, exit
jlt %r1, 6, +1
exit
mov32 %r0, 1
exit
result
0x1
}
-- End of file: jlt-imm.lean

-- Start of file: jlt-reg.lean
------------------------------

def memoryjlt_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjlt_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0
mov %r1, 5
mov %r2, 4
mov %r3, 6
jlt %r1, %r2, exit
jlt %r1, %r1, exit
jlt %r1, %r3, +1
exit
mov %r0, 1
exit
result
0x1
}
-- End of file: jlt-reg.lean

-- Start of file: jlt32-imm.lean
------------------------------

def memoryjlt32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjlt32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 5
or %r1, %r9
jlt32 %r1, 4, exit
jlt32 %r1, 5, exit
jlt32 %r1, 6, +1
exit
mov32 %r0, 1
exit
result
0x1
}
-- End of file: jlt32-imm.lean

-- Start of file: jlt32-reg.lean
------------------------------

def memoryjlt32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjlt32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov %r0, 0
mov %r1, 5
mov %r2, 4
mov %r3, 6
or %r1, %r9
jlt32 %r1, %r2, exit
jlt32 %r1, %r1, exit
jlt32 %r1, %r3, +1
exit
mov %r0, 1
exit
result
0x1
}
-- End of file: jlt32-reg.lean

-- Start of file: jne-reg.lean
------------------------------

def memoryjne_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjne_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov32 %r1, 0xb
mov32 %r2, 0xb
jne %r1, %r2, exit
jne %r1, %r1, exit
mov32 %r0, 1
mov32 %r1, 0xa
jne %r1, %r2, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jne-reg.lean

-- Start of file: jne32-imm.lean
------------------------------

def memoryjne32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjne32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0xb
or %r1, %r9
jne32 %r1, 0xb, +4
mov32 %r0, 1
mov32 %r1, 0xa
or %r1, %r9
jne32 %r1, 0xb, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jne32-imm.lean

-- Start of file: jne32-reg.lean
------------------------------

def memoryjne32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjne32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0xb
or %r1, %r9
mov32 %r2, 0xb
jne32 %r1, %r2, +5
jne32 %r1, %r1, +4
mov32 %r0, 1
mov32 %r1, 0xa
or %r1, %r9
jne32 %r1, %r2, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jne32-reg.lean

-- Start of file: jset-imm.lean
------------------------------

def memoryjset_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjset_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov32 %r1, 0x7
jset %r1, 0x8, exit
mov32 %r0, 1
mov32 %r1, 0x9
jset %r1, 0x8, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jset-imm.lean

-- Start of file: jset-reg.lean
------------------------------

def memoryjset_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjset_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov32 %r1, 0x7
mov32 %r2, 0x8
jset %r1, %r2, exit
jset %r1, %r1, +1
exit
mov32 %r0, 1
mov32 %r1, 0x9
jset %r1, %r2, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jset-reg.lean

-- Start of file: jset32-imm.lean
------------------------------

def memoryjset32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjset32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0x7
or %r1, %r9
jset32 %r1, 0x8, exit
mov32 %r0, 1
mov32 %r1, 0x9
jset32 %r1, 0x8, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jset32-imm.lean

-- Start of file: jset32-reg.lean
------------------------------

def memoryjset32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjset32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0x7
or %r1, %r9
mov32 %r2, 0x8
jset32 %r1, %r2, exit
jset32 %r1, %r1, +1
exit
mov32 %r0, 1
mov32 %r1, 0x9
jset32 %r1, %r2, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jset32-reg.lean

-- Start of file: jsge-imm.lean
------------------------------

def memoryjsge_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjsge_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov %r1, 0xfffffffe
jsge %r1, 0xffffffff, exit
jsge %r1, 0, +4
mov32 %r0, 1
mov %r1, 0xffffffff
jsge %r1, 0xffffffff, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jsge-imm.lean

-- Start of file: jsge-reg.lean
------------------------------

def memoryjsge_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjsge_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov %r1, 0xfffffffe
mov %r2, 0xffffffff
mov32 %r3, 0
jsge %r1, %r2, exit
jsge %r1, %r3, exit
jsge %r1, %r1, +1
exit
mov32 %r0, 1
mov %r1, %r2
jsge %r1, %r2, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jsge-reg.lean

-- Start of file: jsge32-imm.lean
------------------------------

def memoryjsge32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjsge32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0xfffffffe
or %r1, %r9
jsge32 %r1, 0xffffffff, exit
jsge32 %r1, 0, exit
mov32 %r0, 1
mov %r1, 0xffffffff
jsge32 %r1, 0xffffffff, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jsge32-imm.lean

-- Start of file: jsge32-reg.lean
------------------------------

def memoryjsge32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjsge32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0xfffffffe
or %r1, %r9
mov %r2, 0xffffffff
mov32 %r3, 0
jsge32 %r1, %r2, exit
jsge32 %r1, %r3, exit
jsge32 %r1, %r1, +1
exit
mov32 %r0, 1
mov %r1, %r2
jsge32 %r1, %r2, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jsge32-reg.lean

-- Start of file: jsgt-imm.lean
------------------------------

def memoryjsgt_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjsgt_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov %r1, 0xfffffffe
jsgt %r1, 0xffffffff, exit
mov32 %r0, 1
mov32 %r1, 0
jsgt %r1, 0xffffffff, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jsgt-imm.lean

-- Start of file: jsgt-reg.lean
------------------------------

def memoryjsgt_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjsgt_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov %r1, 0xfffffffe
mov %r2, 0xffffffff
jsgt %r1, %r2, exit
jsgt %r1, %r1, exit
mov32 %r0, 1
mov32 %r1, 0
jsgt %r1, %r2, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jsgt-reg.lean

-- Start of file: jsgt32-imm.lean
------------------------------

def memoryjsgt32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjsgt32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0xfffffffe
or %r1, %r9
jsgt32 %r1, 0xffffffff, exit
mov32 %r0, 1
mov32 %r1, 0
jsgt32 %r1, 0xffffffff, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jsgt32-imm.lean

-- Start of file: jsgt32-reg.lean
------------------------------

def memoryjsgt32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjsgt32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0xfffffffe
or %r1, %r9
mov %r2, 0xffffffff
jsgt32 %r1, %r2, exit
jsgt32 %r1, %r1, exit
mov32 %r0, 1
mov32 %r1, 0
jsgt32 %r1, %r2, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jsgt32-reg.lean

-- Start of file: jsle-imm.lean
------------------------------

def memoryjsle_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjsle_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov %r1, 0xfffffffe
jsle %r1, 0xfffffffd, exit
jsle %r1, 0xffffffff, +1
exit
mov32 %r0, 1
jsle %r1, 0xfffffffe, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jsle-imm.lean

-- Start of file: jsle-reg.lean
------------------------------

def memoryjsle_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjsle_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov %r1, 0xffffffff
mov %r2, 0xfffffffe
mov32 %r3, 0
jsle %r1, %r2, exit
jsle %r1, %r3, +1
exit
jsle %r1, %r1, +1
exit
mov32 %r0, 1
mov %r1, %r2
jsle %r1, %r2, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jsle-reg.lean

-- Start of file: jsle32-imm.lean
------------------------------

def memoryjsle32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjsle32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0xfffffffe
or %r1, %r9
jsle32 %r1, 0xfffffffd, exit
jsle32 %r1, 0xffffffff, +1
exit
mov32 %r0, 1
jsle32 %r1, 0xfffffffe, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jsle32-imm.lean

-- Start of file: jsle32-reg.lean
------------------------------

def memoryjsle32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjsle32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0xffffffff
or %r1, %r9
mov %r2, 0xfffffffe
mov32 %r3, 0
jsle32 %r1, %r2, exit
jsle32 %r1, %r3, +1
exit
jsle32 %r1, %r1, +1
exit
mov32 %r0, 1
mov %r1, %r2
jsle32 %r1, %r2, +1
mov32 %r0, 2
exit
result
0x1
}
-- End of file: jsle32-reg.lean

-- Start of file: jslt-imm.lean
------------------------------

def memoryjslt_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjslt_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov %r1, 0xfffffffe
jslt %r1, 0xfffffffd, exit
jslt %r1, 0xfffffffe, exit
jslt %r1, 0xffffffff, +1
exit
mov32 %r0, 1
exit
result
0x1
}
-- End of file: jslt-imm.lean

-- Start of file: jslt-reg.lean
------------------------------

def memoryjslt_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjslt_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0
mov %r1, 0xfffffffe
mov %r2, 0xfffffffd
mov %r3, 0xffffffff
jslt %r1, %r1, exit
jslt %r1, %r2, exit
jslt %r1, %r3, +1
exit
mov32 %r0, 1
exit
result
0x1
}
-- End of file: jslt-reg.lean

-- Start of file: jslt32-imm.lean
------------------------------

def memoryjslt32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjslt32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0xfffffffe
or %r1, %r9
jslt32 %r1, 0xfffffffd, exit
jslt32 %r1, 0xfffffffe, exit
jslt32 %r1, 0xffffffff, +1
exit
mov32 %r0, 1
exit
result
0x1
}
-- End of file: jslt32-imm.lean

-- Start of file: jslt32-reg.lean
------------------------------

def memoryjslt32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progjslt32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r9, 1
lsh %r9, 32
mov32 %r0, 0
mov32 %r1, 0xfffffffe
or %r1, %r9
mov %r2, 0xfffffffd
mov %r3, 0xffffffff
jslt32 %r1, %r1, exit
jslt32 %r1, %r2, exit
jslt32 %r1, %r3, +1
exit
mov32 %r0, 1
exit
result
0x1
}
-- End of file: jslt32-reg.lean

-- Start of file: lddw.lean
------------------------------

def memorylddw :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def proglddw : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r0, 0x1122334455667788
exit
result
0x1122334455667788
}
-- End of file: lddw.lean

-- Start of file: lddw2.lean
------------------------------

def memorylddw2 :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def proglddw2 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r0, 2147483648
exit
result
0x0000000080000000
}
-- End of file: lddw2.lean

-- Start of file: ldxb-all.lean
------------------------------

def memoryldxb_all :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '1' '0' '2' '0' '3' '0' '4' '0' '5' '0' '6' '0' '7' '0' '8' '0' '9' }
def progldxb_all : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, %r1
ldxb %r9, [%r0+0]
lsh %r9, 0
ldxb %r8, [%r0+0x1]
lsh %r8, 4
ldxb %r7, [%r0+2]
lsh %r7, 8
ldxb %r6, [%r0+3]
lsh %r6, 12
ldxb %r5, [%r0+4]
lsh %r5, 16
ldxb %r4, [%r0+5]
lsh %r4, 20
ldxb %r3, [%r0+6]
lsh %r3, 24
ldxb %r2, [%r0+7]
lsh %r2, 28
ldxb %r1, [%r0+8]
lsh %r1, 32
ldxb %r0, [%r0+9]
lsh %r0, 36
or %r0, %r1
or %r0, %r2
or %r0, %r3
or %r0, %r4
or %r0, %r5
or %r0, %r6
or %r0, %r7
or %r0, %r8
or %r0, %r9
exit
result
0x9876543210
}
-- End of file: ldxb-all.lean

-- Start of file: ldxb.lean
------------------------------

def memoryldxb :=
createStackMemory 0 emptyMemory
{mem|
'a' 'a' 'b' 'b' '1' '1' 'c' 'c' 'd' 'd' }
def progldxb : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxb %r0, [%r1+0x2]
exit
result
0x11
}
-- End of file: ldxb.lean

-- Start of file: ldxdw.lean
------------------------------

def memoryldxdw :=
createStackMemory 0 emptyMemory
{mem|
'a' 'a' 'b' 'b' '1' '1' '2' '2' '3' '3' '4' '4' '5' '5' '6' '6' '7' '7' '8' '8' 'c' 'c' 'd' 'd' }
def progldxdw : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1+2]
exit
result
0x8877665544332211
}
-- End of file: ldxdw.lean

-- Start of file: ldxh-all.lean
------------------------------

def memoryldxh_all :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '1' '0' '0' '0' '2' '0' '0' '0' '3' '0' '0' '0' '4' '0' '0' '0' '5' '0' '0' '0' '6' '0' '0' '0' '7' '0' '0' '0' '8' '0' '0' '0' '9' }
def progldxh_all : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, %r1
ldxh %r9, [%r0+0]
be16 %r9
lsh %r9, 0
ldxh %r8, [%r0+2]
be16 %r8
lsh %r8, 4
ldxh %r7, [%r0+4]
be16 %r7
lsh %r7, 8
ldxh %r6, [%r0+6]
be16 %r6
lsh %r6, 12
ldxh %r5, [%r0+8]
be16 %r5
lsh %r5, 16
ldxh %r4, [%r0+10]
be16 %r4
lsh %r4, 20
ldxh %r3, [%r0+12]
be16 %r3
lsh %r3, 24
ldxh %r2, [%r0+14]
be16 %r2
lsh %r2, 28
ldxh %r1, [%r0+16]
be16 %r1
lsh %r1, 32
ldxh %r0, [%r0+18]
be16 %r0
lsh %r0, 36
or %r0, %r1
or %r0, %r2
or %r0, %r3
or %r0, %r4
or %r0, %r5
or %r0, %r6
or %r0, %r7
or %r0, %r8
or %r0, %r9
exit
result
0x9876543210
}
-- End of file: ldxh-all.lean

-- Start of file: ldxh-all2.lean
------------------------------

def memoryldxh_all2 :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '1'
'0' '0' '0' '2'
'0' '0' '0' '4'
'0' '0' '0' '8'
'0' '0' '1' '0'
'0' '0' '2' '0'
'0' '0' '4' '0'
'0' '0' '8' '0'
'0' '1' '0' '0'
'0' '2' '0' '0' }
def progldxh_all2 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, %r1
ldxh %r9, [%r0+0]
be16 %r9
ldxh %r8, [%r0+2]
be16 %r8
ldxh %r7, [%r0+4]
be16 %r7
ldxh %r6, [%r0+6]
be16 %r6
ldxh %r5, [%r0+8]
be16 %r5
ldxh %r4, [%r0+10]
be16 %r4
ldxh %r3, [%r0+12]
be16 %r3
ldxh %r2, [%r0+14]
be16 %r2
ldxh %r1, [%r0+16]
be16 %r1
ldxh %r0, [%r0+18]
be16 %r0
or %r0, %r1
or %r0, %r2
or %r0, %r3
or %r0, %r4
or %r0, %r5
or %r0, %r6
or %r0, %r7
or %r0, %r8
or %r0, %r9
exit
result
0x3ff
}
-- End of file: ldxh-all2.lean

-- Start of file: ldxh-same-reg.lean
------------------------------

def memoryldxh_same_reg :=
createStackMemory 0 emptyMemory
{mem|
'f' 'f' 'f' 'f' }
def progldxh_same_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, %r1
sth [%r0], 0x1234
ldxh %r0, [%r0]
exit
result
0x1234
}
-- End of file: ldxh-same-reg.lean

-- Start of file: ldxh.lean
------------------------------

def memoryldxh :=
createStackMemory 0 emptyMemory
{mem|
'a' 'a' 'b' 'b' '1' '1' '2' '2' 'c' 'c' 'd' 'd' }
def progldxh : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxh %r0, [%r1+2]
exit
result
0x2211
}
-- End of file: ldxh.lean

-- Start of file: ldxw-all.lean
------------------------------

def memoryldxw_all :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '1'
'0' '0' '0' '0' '0' '0' '0' '2'
'0' '0' '0' '0' '0' '0' '0' '4'
'0' '0' '0' '0' '0' '0' '0' '8'
'0' '0' '0' '0' '0' '1' '0' '0'
'0' '0' '0' '0' '0' '2' '0' '0'
'0' '0' '0' '0' '0' '4' '0' '0'
'0' '0' '0' '0' '0' '8' '0' '0'
'0' '0' '0' '1' '0' '0' '0' '0'
'0' '0' '0' '2' '0' '0' '0' '0' }
def progldxw_all : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, %r1
ldxw %r9, [%r0+0]
be32 %r9
ldxw %r8, [%r0+4]
be32 %r8
ldxw %r7, [%r0+8]
be32 %r7
ldxw %r6, [%r0+12]
be32 %r6
ldxw %r5, [%r0+16]
be32 %r5
ldxw %r4, [%r0+20]
be32 %r4
ldxw %r3, [%r0+24]
be32 %r3
ldxw %r2, [%r0+28]
be32 %r2
ldxw %r1, [%r0+32]
be32 %r1
ldxw %r0, [%r0+36]
be32 %r0
or %r0, %r1
or %r0, %r2
or %r0, %r3
or %r0, %r4
or %r0, %r5
or %r0, %r6
or %r0, %r7
or %r0, %r8
or %r0, %r9
exit
result
0x030f0f
}
-- End of file: ldxw-all.lean

-- Start of file: ldxw.lean
------------------------------

def memoryldxw :=
createStackMemory 0 emptyMemory
{mem|
'a' 'a' 'b' 'b' '1' '1' '2' '2' '3' '3' '4' '4' 'c' 'c' 'd' 'd' }
def progldxw : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxw %r0, [%r1+2]
exit
result
0x44332211
}
-- End of file: ldxw.lean

-- Start of file: le16-high.lean
------------------------------

def memoryle16_high :=
createStackMemory 0 emptyMemory
{mem|
'2' '2' '1' '1' '0' '0' 'F' 'F' 'E' 'E' 'D' 'D' 'C' 'C' 'B' 'B' 'A' 'A' }
def progle16_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1]
le16 %r0
exit
result
0x1122
}
-- End of file: le16-high.lean

-- Start of file: le16.lean
------------------------------

def memoryle16 :=
createStackMemory 0 emptyMemory
{mem|
'2' '2' '1' '1' }
def progle16 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxh %r0, [%r1]
le16 %r0
exit
result
0x1122
}
-- End of file: le16.lean

-- Start of file: le32-high.lean
------------------------------

def memoryle32_high :=
createStackMemory 0 emptyMemory
{mem|
'4' '4' '3' '3' '2' '2' '1' '1' '0' '0' 'F' 'F' 'E' 'E' 'D' 'D' }
def progle32_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1]
le32 %r0
exit
result
0x11223344
}
-- End of file: le32-high.lean

-- Start of file: le32.lean
------------------------------

def memoryle32 :=
createStackMemory 0 emptyMemory
{mem|
'4' '4' '3' '3' '2' '2' '1' '1' }
def progle32 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxw %r0, [%r1]
le32 %r0
exit
result
0x11223344
}
-- End of file: le32.lean

-- Start of file: le64.lean
------------------------------

def memoryle64 :=
createStackMemory 0 emptyMemory
{mem|
'8' '8' '7' '7' '6' '6' '5' '5' '4' '4' '3' '3' '2' '2' '1' '1' }
def progle64 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1]
le64 %r0
exit
result
0x1122334455667788
}
-- End of file: le64.lean

-- Start of file: lsh32-imm-high.lean
------------------------------

def memorylsh32_imm_high :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def proglsh32_imm_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x11
lsh32 %r0, 60
exit
result
0x10000000
}
-- End of file: lsh32-imm-high.lean

-- Start of file: lsh32-imm-neg.lean
------------------------------

def memorylsh32_imm_neg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def proglsh32_imm_neg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x11
lsh32 %r0, -4
exit
result
0x10000000
}
-- End of file: lsh32-imm-neg.lean

-- Start of file: lsh32-imm.lean
------------------------------

def memorylsh32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def proglsh32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x11
lsh32 %r0, 28
exit
result
0x10000000
}
-- End of file: lsh32-imm.lean

-- Start of file: lsh32-reg-high.lean
------------------------------

def memorylsh32_reg_high :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def proglsh32_reg_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x11
mov %r7, 60
lsh32 %r0, %r7
exit
result
0x10000000
}
-- End of file: lsh32-reg-high.lean

-- Start of file: lsh32-reg-neg.lean
------------------------------

def memorylsh32_reg_neg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def proglsh32_reg_neg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x11
mov %r7, -4
lsh32 %r0, %r7
exit
result
0x10000000
}
-- End of file: lsh32-reg-neg.lean

-- Start of file: lsh32-reg.lean
------------------------------

def memorylsh32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def proglsh32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x11
mov %r7, 28
lsh32 %r0, %r7
exit
result
0x10000000
}
-- End of file: lsh32-reg.lean

-- Start of file: lsh64-imm-high.lean
------------------------------

def memorylsh64_imm_high :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def proglsh64_imm_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x1
lsh %r0, 68
exit
result
0x10
}
-- End of file: lsh64-imm-high.lean

-- Start of file: lsh64-imm-neg.lean
------------------------------

def memorylsh64_imm_neg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def proglsh64_imm_neg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x1
lsh %r0, -60
exit
result
0x10
}
-- End of file: lsh64-imm-neg.lean

-- Start of file: lsh64-imm.lean
------------------------------

def memorylsh64_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def proglsh64_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x1
lsh %r0, 4
exit
result
0x10
}
-- End of file: lsh64-imm.lean

-- Start of file: lsh64-reg-high.lean
------------------------------

def memorylsh64_reg_high :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def proglsh64_reg_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x1
mov %r7, 68
lsh %r0, %r7
exit
result
0x10
}
-- End of file: lsh64-reg-high.lean

-- Start of file: lsh64-reg-neg.lean
------------------------------

def memorylsh64_reg_neg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def proglsh64_reg_neg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x1
mov %r7, -60
lsh %r0, %r7
exit
result
0x10
}
-- End of file: lsh64-reg-neg.lean

-- Start of file: lsh64-reg.lean
------------------------------

def memorylsh64_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def proglsh64_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x1
mov %r7, 4
lsh %r0, %r7
exit
result
0x10
}
-- End of file: lsh64-reg.lean

-- Start of file: mem-len.lean
------------------------------

def memorymem_len :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '1'
'0' '0' '0' '0' '0' '0' '0' '2' }
def progmem_len : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, %r2
exit
result
0x8
}
-- End of file: mem-len.lean

-- Start of file: mod-by-zero-reg.lean
------------------------------

def memorymod_zero_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmod_zero_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
mov32 %r1, 0
mod32 %r0, %r1
exit
result
0x1
}
-- End of file: mod-by-zero-reg.lean

-- Start of file: mod.lean
------------------------------

def memorymod :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmod : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 5748
mod32 %r0, 92
jne %r0, 44, exit
mov32 %r1, 13
mod32 %r0, %r1
exit
result
0x5
}
-- End of file: mod.lean

-- Start of file: mod32.lean
------------------------------

def memorymod32 :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmod32 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r0, 0x100000003
mod32 %r0, 3
exit
result
0x0
}
-- End of file: mod32.lean

-- Start of file: mod64-by-zero-reg.lean
------------------------------

def memorymod64_zero_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmod64_zero_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
mov32 %r1, 0
mod %r0, %r1
exit
result
0x1
}
-- End of file: mod64-by-zero-reg.lean

-- Start of file: mod64.lean
------------------------------

def memorymod64 :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmod64 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0xb1858436
lsh %r0, 32
or %r0, 0x100dc5c8
mov32 %r1, 0xdde263e
lsh %r1, 32
or %r1, 0x3cbef7f3
mod %r0, %r1
mod %r0, 0x658f1778
exit
result
0x30ba5a04
}
-- End of file: mod64.lean

-- Start of file: mov.lean
------------------------------

def memorymov :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmov : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r1, 2
mov32 %r0, %r1
jne %r0, 2, exit
lddw %r2, 0xFFFFFF00000002
mov32 %r0, %r2
jne %r0, 2, exit
mov32 %r0, 1
exit
result
0x1
}
-- End of file: mov.lean

-- Start of file: mov64-sign-extend.lean
------------------------------

def memorymov64_sign_extend :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmov64_sign_extend : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, -10
exit
result
0xFFFFFFFFFFFFFFF6
}
-- End of file: mov64-sign-extend.lean

-- Start of file: mov64.lean
------------------------------

def memorymov64 :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmov64 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r1, 1
mov %r0, %r1
mov %r0, %r0
exit
result
0x1
}
-- End of file: mov64.lean

-- Start of file: movsx1632-reg.lean
------------------------------

def memorymovsx1632_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmovsx1632_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r1, 0x0123456789abcdef
movsx1632 %r0, %r1
exit
result
0xffffcdef
}
-- End of file: movsx1632-reg.lean

-- Start of file: movsx1664-reg.lean
------------------------------

def memorymovsx1664_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmovsx1664_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r1, 0x0123456789abcdef
movsx1664 %r0, %r1
exit
result
0xffffffffffffcdef
}
-- End of file: movsx1664-reg.lean

-- Start of file: movsx3264-reg.lean
------------------------------

def memorymovsx3264_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmovsx3264_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r1, 0x0123456789abcdef
movsx3264 %r0, %r1
exit
result
0xffffffff89abcdef
}
-- End of file: movsx3264-reg.lean

-- Start of file: movsx832-reg.lean
------------------------------

def memorymovsx832_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmovsx832_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r1, 0x0123456789abcdef
movsx832 %r0, %r1
exit
result
0xffffffef
}
-- End of file: movsx832-reg.lean

-- Start of file: movsx864-reg.lean
------------------------------

def memorymovsx864_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmovsx864_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r1, 0x0123456789abcdef
movsx864 %r0, %r1
exit
result
0xffffffffffffffef
}
-- End of file: movsx864-reg.lean

-- Start of file: mul32-imm.lean
------------------------------

def memorymul32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmul32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 3
mul32 %r0, 4
exit
result
0xc
}
-- End of file: mul32-imm.lean

-- Start of file: mul32-intmin-by-negone-imm.lean
------------------------------

def memorymul32_intmin_negone_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmul32_intmin_negone_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x80000000
mul32 %r0, -1
exit
result
0x80000000
}
-- End of file: mul32-intmin-by-negone-imm.lean

-- Start of file: mul32-intmin-by-negone-reg.lean
------------------------------

def memorymul32_intmin_negone_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmul32_intmin_negone_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x80000000
mov %r1, -1
mul32 %r0, %r1
exit
result
0x80000000
}
-- End of file: mul32-intmin-by-negone-reg.lean

-- Start of file: mul32-reg-overflow.lean
------------------------------

def memorymul32_reg_overflow :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmul32_reg_overflow : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x40000001
mov %r1, 4
mul32 %r0, %r1
exit
result
0x4
}
-- End of file: mul32-reg-overflow.lean

-- Start of file: mul32-reg.lean
------------------------------

def memorymul32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmul32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 3
mov %r1, 4
mul32 %r0, %r1
exit
result
0xc
}
-- End of file: mul32-reg.lean

-- Start of file: mul64-imm.lean
------------------------------

def memorymul64_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmul64_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x40000001
mul %r0, 4
exit
result
0x100000004
}
-- End of file: mul64-imm.lean

-- Start of file: mul64-intmin-by-negone-imm.lean
------------------------------

def memorymul64_intmin_negone_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '8' '0' }
def progmul64_intmin_negone_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1]
mul %r0, -1
exit
result
0x8000000000000000
}
-- End of file: mul64-intmin-by-negone-imm.lean

-- Start of file: mul64-intmin-by-negone-reg.lean
------------------------------

def memorymul64_intmin_negone_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '8' '0' }
def progmul64_intmin_negone_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1]
mov %r1, -1
mul %r0, %r1
exit
result
0x8000000000000000
}
-- End of file: mul64-intmin-by-negone-reg.lean

-- Start of file: mul64-reg.lean
------------------------------

def memorymul64_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progmul64_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x40000001
mov %r1, 4
mul %r0, %r1
exit
result
0x100000004
}
-- End of file: mul64-reg.lean

-- Start of file: neg.lean
------------------------------

def memoryneg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progneg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r0, 0x100000002
neg32 %r0
exit
result
0xfffffffe
}
-- End of file: neg.lean

-- Start of file: neg32-intmin-imm.lean
------------------------------

def memoryneg32_intmin_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progneg32_intmin_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r0, 0x80000000
neg32 %r0
exit
result
0x80000000
}
-- End of file: neg32-intmin-imm.lean

-- Start of file: neg32-intmin-reg.lean
------------------------------

def memoryneg32_intmin_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progneg32_intmin_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x80000000
neg32 %r0
exit
result
0x80000000
}
-- End of file: neg32-intmin-reg.lean

-- Start of file: neg64-intmin-imm.lean
------------------------------

def memoryneg64_intmin_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '8' '0' }
def progneg64_intmin_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1]
neg %r0
exit
result
0x8000000000000000
}
-- End of file: neg64-intmin-imm.lean

-- Start of file: neg64-intmin-reg.lean
------------------------------

def memoryneg64_intmin_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '8' '0' }
def progneg64_intmin_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1]
mov %r1, -1
neg %r0
exit
result
0x8000000000000000
}
-- End of file: neg64-intmin-reg.lean

-- Start of file: neg64.lean
------------------------------

def memoryneg64 :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progneg64 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 2
neg %r0
exit
result
0xfffffffffffffffe
}
-- End of file: neg64.lean

-- Start of file: rsh32-imm-high.lean
------------------------------

def memoryrsh32_imm_high :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progrsh32_imm_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0
sub %r0, 1
rsh32 %r0, 40
exit
result
0x00ffffff
}
-- End of file: rsh32-imm-high.lean

-- Start of file: rsh32-imm-neg.lean
------------------------------

def memoryrsh32_imm_neg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progrsh32_imm_neg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0
sub %r0, 1
rsh32 %r0, -24
exit
result
0x00ffffff
}
-- End of file: rsh32-imm-neg.lean

-- Start of file: rsh32-imm.lean
------------------------------

def memoryrsh32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progrsh32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0
sub %r0, 1
rsh32 %r0, 8
exit
result
0x00ffffff
}
-- End of file: rsh32-imm.lean

-- Start of file: rsh32-reg-high.lean
------------------------------

def memoryrsh32_reg_high :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progrsh32_reg_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0
sub %r0, 1
mov %r7, 40
rsh32 %r0, %r7
exit
result
0x00ffffff
}
-- End of file: rsh32-reg-high.lean

-- Start of file: rsh32-reg-neg.lean
------------------------------

def memoryrsh32_reg_neg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progrsh32_reg_neg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0
sub %r0, 1
mov %r7, -24
rsh32 %r0, %r7
exit
result
0x00ffffff
}
-- End of file: rsh32-reg-neg.lean

-- Start of file: rsh32-reg.lean
------------------------------

def memoryrsh32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progrsh32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0
sub %r0, 1
mov %r7, 8
rsh32 %r0, %r7
exit
result
0x00ffffff
}
-- End of file: rsh32-reg.lean

-- Start of file: rsh64-imm-high.lean
------------------------------

def memoryrsh64_imm_high :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progrsh64_imm_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x10
rsh %r0, 68
exit
result
0x1
}
-- End of file: rsh64-imm-high.lean

-- Start of file: rsh64-imm-neg.lean
------------------------------

def memoryrsh64_imm_neg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progrsh64_imm_neg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x10
rsh %r0, -60
exit
result
0x1
}
-- End of file: rsh64-imm-neg.lean

-- Start of file: rsh64-imm.lean
------------------------------

def memoryrsh64_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progrsh64_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x10
rsh %r0, 4
exit
result
0x1
}
-- End of file: rsh64-imm.lean

-- Start of file: rsh64-reg-high.lean
------------------------------

def memoryrsh64_reg_high :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progrsh64_reg_high : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x10
mov %r7, 68
rsh %r0, %r7
exit
result
0x1
}
-- End of file: rsh64-reg-high.lean

-- Start of file: rsh64-reg-neg.lean
------------------------------

def memoryrsh64_reg_neg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progrsh64_reg_neg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x10
mov %r7, -60
rsh %r0, %r7
exit
result
0x1
}
-- End of file: rsh64-reg-neg.lean

-- Start of file: rsh64-reg.lean
------------------------------

def memoryrsh64_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progrsh64_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0x10
mov %r7, 4
rsh %r0, %r7
exit
result
0x1
}
-- End of file: rsh64-reg.lean

-- Start of file: sdiv32-by-zero-imm.lean
------------------------------

def memorysdiv32_zero_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsdiv32_zero_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
sdiv32 %r0, 0
exit
result
0x0
}
-- End of file: sdiv32-by-zero-imm.lean

-- Start of file: sdiv32-by-zero-reg.lean
------------------------------

def memorysdiv32_zero_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsdiv32_zero_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
mov32 %r1, 0
sdiv32 %r0, %r1
exit
result
0x0
}
-- End of file: sdiv32-by-zero-reg.lean

-- Start of file: sdiv32-imm.lean
------------------------------

def memorysdiv32_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsdiv32_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r0, 0x10000000c
sdiv32 %r0, -4
exit
result
0xfffffffd
}
-- End of file: sdiv32-imm.lean

-- Start of file: sdiv32-intmin-by-negone-imm.lean
------------------------------

def memorysdiv32_intmin_negone_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsdiv32_intmin_negone_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0x80000000
sdiv32 %r0, -1
exit
result
0x80000000
}
-- End of file: sdiv32-intmin-by-negone-imm.lean

-- Start of file: sdiv32-intmin-by-negone-reg.lean
------------------------------

def memorysdiv32_intmin_negone_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsdiv32_intmin_negone_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0x80000000
mov32 %r1, -1
sdiv32 %r0, %r1
exit
result
0x80000000
}
-- End of file: sdiv32-intmin-by-negone-reg.lean

-- Start of file: sdiv32-reg.lean
------------------------------

def memorysdiv32_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsdiv32_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r0, 0x10000000c
mov %r1, -4
sdiv32 %r0, %r1
exit
result
0xfffffffd
}
-- End of file: sdiv32-reg.lean

-- Start of file: sdiv64-by-zero-imm.lean
------------------------------

def memorysdiv64_zero_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsdiv64_zero_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
sdiv %r0, 0
exit
result
0x0
}
-- End of file: sdiv64-by-zero-imm.lean

-- Start of file: sdiv64-by-zero-reg.lean
------------------------------

def memorysdiv64_zero_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsdiv64_zero_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 1
mov32 %r1, 0
sdiv %r0, %r1
exit
result
0x0
}
-- End of file: sdiv64-by-zero-reg.lean

-- Start of file: sdiv64-imm.lean
------------------------------

def memorysdiv64_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsdiv64_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0xc
lsh %r0, 32
sdiv %r0, -4
exit
result
0xfffffffd00000000
}
-- End of file: sdiv64-imm.lean

-- Start of file: sdiv64-intmin-by-negone-imm.lean
------------------------------

def memorysdiv64_intmin_negone_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '8' '0' }
def progsdiv64_intmin_negone_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1]
sdiv %r0, -1
exit
result
0x8000000000000000
}
-- End of file: sdiv64-intmin-by-negone-imm.lean

-- Start of file: sdiv64-intmin-by-negone-reg.lean
------------------------------

def memorysdiv64_intmin_negone_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '8' '0' }
def progsdiv64_intmin_negone_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1]
mov %r1, -1
sdiv %r0, %r1
exit
result
0x8000000000000000
}
-- End of file: sdiv64-intmin-by-negone-reg.lean

-- Start of file: sdiv64-reg.lean
------------------------------

def memorysdiv64_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsdiv64_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0xc
lsh %r0, 32
mov %r1, -4
sdiv %r0, %r1
exit
result
0xfffffffd00000000
}
-- End of file: sdiv64-reg.lean

-- Start of file: smod32-intmin-by-negone-imm.lean
------------------------------

def memorysmod32_intmin_negone_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod32_intmin_negone_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0x80000000
smod32 %r0, -1
exit
result
0x0
}
-- End of file: smod32-intmin-by-negone-imm.lean

-- Start of file: smod32-intmin-by-negone-reg.lean
------------------------------

def memorysmod32_intmin_negone_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod32_intmin_negone_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 0x80000000
mov32 %r1, -1
smod32 %r0, %r1
exit
result
0x0
}
-- End of file: smod32-intmin-by-negone-reg.lean

-- Start of file: smod32-neg-by-neg-imm.lean
------------------------------

def memorysmod32_neg_neg_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod32_neg_neg_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, -13
smod32 %r0, -3
exit
result
0xffffffff
}
-- End of file: smod32-neg-by-neg-imm.lean

-- Start of file: smod32-neg-by-neg-reg.lean
------------------------------

def memorysmod32_neg_neg_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod32_neg_neg_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, -13
mov32 %r1, -3
smod32 %r0, %r1
exit
result
0xffffffff
}
-- End of file: smod32-neg-by-neg-reg.lean

-- Start of file: smod32-neg-by-pos-imm.lean
------------------------------

def memorysmod32_neg_pos_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod32_neg_pos_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, -13
smod32 %r0, 4
exit
result
0xffffffff
}
-- End of file: smod32-neg-by-pos-imm.lean

-- Start of file: smod32-neg-by-pos-reg.lean
------------------------------

def memorysmod32_neg_pos_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod32_neg_pos_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, -13
mov32 %r1, 4
smod32 %r0, %r1
exit
result
0xffffffff
}
-- End of file: smod32-neg-by-pos-reg.lean

-- Start of file: smod32-neg-by-zero-imm.lean
------------------------------

def memorysmod32_neg_zero_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod32_neg_zero_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, -10
smod32 %r0, 0
exit
result
0xFFFFFFF6
}
-- End of file: smod32-neg-by-zero-imm.lean

-- Start of file: smod32-neg-by-zero-reg.lean
------------------------------

def memorysmod32_neg_zero_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod32_neg_zero_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, -10
mov32 %r1, 0
smod32 %r0, %r1
exit
result
0xFFFFFFF6
}
-- End of file: smod32-neg-by-zero-reg.lean

-- Start of file: smod32-pos-by-neg-imm.lean
------------------------------

def memorysmod32_pos_neg_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod32_pos_neg_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 13
smod32 %r0, -3
exit
result
0x1
}
-- End of file: smod32-pos-by-neg-imm.lean

-- Start of file: smod32-pos-by-neg-reg.lean
------------------------------

def memorysmod32_pos_neg_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod32_pos_neg_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r0, 13
mov32 %r1, -3
smod32 %r0, %r1
exit
result
0x1
}
-- End of file: smod32-pos-by-neg-reg.lean

-- Start of file: smod64-intmin-by-negone-imm.lean
------------------------------

def memorysmod64_intmin_negone_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '8' '0' }
def progsmod64_intmin_negone_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1]
smod %r0, -1
exit
result
0x0
}
-- End of file: smod64-intmin-by-negone-imm.lean

-- Start of file: smod64-intmin-by-negone-reg.lean
------------------------------

def memorysmod64_intmin_negone_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '8' '0' }
def progsmod64_intmin_negone_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxdw %r0, [%r1]
mov %r1, -1
smod %r0, %r1
exit
result
0x0
}
-- End of file: smod64-intmin-by-negone-reg.lean

-- Start of file: smod64-neg-by-neg-imm.lean
------------------------------

def memorysmod64_neg_neg_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod64_neg_neg_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, -13
smod %r0, -3
exit
result
0xffffffffffffffff
}
-- End of file: smod64-neg-by-neg-imm.lean

-- Start of file: smod64-neg-by-neg-reg.lean
------------------------------

def memorysmod64_neg_neg_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod64_neg_neg_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, -13
mov %r1, -3
smod %r0, %r1
exit
result
0xffffffffffffffff
}
-- End of file: smod64-neg-by-neg-reg.lean

-- Start of file: smod64-neg-by-pos-imm.lean
------------------------------

def memorysmod64_neg_pos_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod64_neg_pos_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, -13
smod %r0, 4
exit
result
0xffffffffffffffff
}
-- End of file: smod64-neg-by-pos-imm.lean

-- Start of file: smod64-neg-by-pos-reg.lean
------------------------------

def memorysmod64_neg_pos_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod64_neg_pos_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, -13
mov %r1, 4
smod %r0, %r1
exit
result
0xffffffffffffffff
}
-- End of file: smod64-neg-by-pos-reg.lean

-- Start of file: smod64-neg-by-zero-imm.lean
------------------------------

def memorysmod64_neg_zero_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod64_neg_zero_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, -10
smod %r0, 0
exit
result
0xFFFFFFFFFFFFFFF6
}
-- End of file: smod64-neg-by-zero-imm.lean

-- Start of file: smod64-neg-by-zero-reg.lean
------------------------------

def memorysmod64_neg_zero_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod64_neg_zero_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, -10
mov %r1, 0
smod %r0, %r1
exit
result
0xFFFFFFFFFFFFFFF6
}
-- End of file: smod64-neg-by-zero-reg.lean

-- Start of file: smod64-pos-by-neg-imm.lean
------------------------------

def memorysmod64_pos_neg_imm :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod64_pos_neg_imm : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 13
smod %r0, -3
exit
result
0x1
}
-- End of file: smod64-pos-by-neg-imm.lean

-- Start of file: smod64-pos-by-neg-reg.lean
------------------------------

def memorysmod64_pos_neg_reg :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progsmod64_pos_neg_reg : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 13
mov %r1, -3
smod %r0, %r1
exit
result
0x1
}
-- End of file: smod64-pos-by-neg-reg.lean

-- Start of file: stack.lean
------------------------------

def memorystack :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progstack : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r1, 51
stdw [%r10-16], 0xab
stdw [%r10-8], 0xcd
and %r1, 1
lsh %r1, 3
mov %r2, %r10
add %r2, %r1
ldxdw %r0, [%r2-16]
exit
result
0xcd
}
-- End of file: stack.lean

-- Start of file: stb.lean
------------------------------

def memorystb :=
createStackMemory 0 emptyMemory
{mem|
'a' 'a' 'b' 'b' 'f' 'f' 'c' 'c' 'd' 'd' }
def progstb : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
stb [%r1+2], 0x11
ldxb %r0, [%r1+2]
exit
result
0x11
}
-- End of file: stb.lean

-- Start of file: stdw.lean
------------------------------

def memorystdw :=
createStackMemory 0 emptyMemory
{mem|
'a' 'a' 'b' 'b' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'c' 'c' 'd' 'd' }
def progstdw : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
stdw [%r1+2], 0x44332211
ldxdw %r0, [%r1+2]
exit
result
0x0000000044332211
}
-- End of file: stdw.lean

-- Start of file: sth.lean
------------------------------

def memorysth :=
createStackMemory 0 emptyMemory
{mem|
'a' 'a' 'b' 'b' 'f' 'f' 'f' 'f' 'c' 'c' 'd' 'd' }
def progsth : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
sth [%r1+2], 0x2211
ldxh %r0, [%r1+2]
exit
result
0x2211
}
-- End of file: sth.lean

-- Start of file: stw.lean
------------------------------

def memorystw :=
createStackMemory 0 emptyMemory
{mem|
'a' 'a' 'b' 'b' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'c' 'c' 'd' 'd' }
def progstw : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
stw [%r1+2], 0x44332211
ldxw %r0, [%r1+2]
exit
result
0x44332211
}
-- End of file: stw.lean

-- Start of file: stxb-all.lean
------------------------------

def memorystxb_all :=
createStackMemory 0 emptyMemory
{mem|
'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' }
def progstxb_all : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, 0xf0
mov %r2, 0xf2
mov %r3, 0xf3
mov %r4, 0xf4
mov %r5, 0xf5
mov %r6, 0xf6
mov %r7, 0xf7
mov %r8, 0xf8
stxb [%r1], %r0
stxb [%r1+1], %r2
stxb [%r1+2], %r3
stxb [%r1+3], %r4
stxb [%r1+4], %r5
stxb [%r1+5], %r6
stxb [%r1+6], %r7
stxb [%r1+7], %r8
ldxdw %r0, [%r1]
be64 %r0
exit
result
0xf0f2f3f4f5f6f7f8
}
-- End of file: stxb-all.lean

-- Start of file: stxb-all2.lean
------------------------------

def memorystxb_all2 :=
createStackMemory 0 emptyMemory
{mem|
'f' 'f' 'f' 'f' }
def progstxb_all2 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, %r1
mov %r1, 0xf1
mov %r9, 0xf9
stxb [%r0], %r1
stxb [%r0+1], %r9
ldxh %r0, [%r0]
be16 %r0
exit
result
0xf1f9
}
-- End of file: stxb-all2.lean

-- Start of file: stxb-chain.lean
------------------------------

def memorystxb_chain :=
createStackMemory 0 emptyMemory
{mem|
'2' 'a' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progstxb_chain : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r0, %r1
ldxb %r9, [%r0+0]
stxb [%r0+1], %r9
ldxb %r8, [%r0+1]
stxb [%r0+2], %r8
ldxb %r7, [%r0+2]
stxb [%r0+3], %r7
ldxb %r6, [%r0+3]
stxb [%r0+4], %r6
ldxb %r5, [%r0+4]
stxb [%r0+5], %r5
ldxb %r4, [%r0+5]
stxb [%r0+6], %r4
ldxb %r3, [%r0+6]
stxb [%r0+7], %r3
ldxb %r2, [%r0+7]
stxb [%r0+8], %r2
ldxb %r1, [%r0+8]
stxb [%r0+9], %r1
ldxb %r0, [%r0+9]
exit
result
0x2a
}
-- End of file: stxb-chain.lean

-- Start of file: stxb.lean
------------------------------

def memorystxb :=
createStackMemory 0 emptyMemory
{mem|
'a' 'a' 'b' 'b' 'f' 'f' 'c' 'c' 'd' 'd' }
def progstxb : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r2, 0x11
stxb [%r1+2], %r2
ldxb %r0, [%r1+2]
exit
result
0x11
}
-- End of file: stxb.lean

-- Start of file: stxdw.lean
------------------------------

def memorystxdw :=
createStackMemory 0 emptyMemory
{mem|
'a' 'a' 'b' 'b' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'c' 'c' 'd' 'd' }
def progstxdw : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r2, 0x88776655
lsh %r2, 32
or %r2, 0x44332211
stxdw [%r1+2], %r2
ldxdw %r0, [%r1+2]
exit
result
0x8877665544332211
}
-- End of file: stxdw.lean

-- Start of file: stxh.lean
------------------------------

def memorystxh :=
createStackMemory 0 emptyMemory
{mem|
'a' 'a' 'b' 'b' 'f' 'f' 'f' 'f' 'c' 'c' 'd' 'd' }
def progstxh : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r2, 0x2211
stxh [%r1+2], %r2
ldxh %r0, [%r1+2]
exit
result
0x2211
}
-- End of file: stxh.lean




-- Start of file: stxw.lean
------------------------------

def memorystxw :=
createStackMemory 0 emptyMemory
{mem|
'a' 'a' 'b' 'b' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'f' 'c' 'c' 'd' 'd' }
def progstxw : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov32 %r2, 0x44332211
stxw [%r1+2], %r2
ldxw %r0, [%r1+2]
exit
result
0x44332211
}
-- End of file: stxw.lean

-- Start of file: subnet.lean
------------------------------

def memorysubnet :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' 'c' '0' '9' 'f' 'a' '0' '9' '7' '0' '0' 'a' '0'
'c' 'c' '3' 'b' 'b' 'f' 'f' 'a' '0' '8' '0' '0' '4' '5' '1' '0'
'0' '0' '3' 'c' '4' '6' '3' 'c' '4' '0' '0' '0' '4' '0' '0' '6'
'7' '3' '1' 'c' 'c' '0' 'a' '8' '0' '1' '0' '2' 'c' '0' 'a' '8'
'0' '1' '0' '1' '0' '6' '0' 'e' '0' '0' '1' '7' '9' '9' 'c' '5'
'a' '0' 'e' 'c' '0' '0' '0' '0' '0' '0' '0' '0' 'a' '0' '0' '2'
'7' 'd' '7' '8' 'e' '0' 'a' '3' '0' '0' '0' '0' '0' '2' '0' '4'
'0' '5' 'b' '4' '0' '4' '0' '2' '0' '8' '0' 'a' '0' '0' '9' 'c'
'2' '7' '2' '4' '0' '0' '0' '0' '0' '0' '0' '0' '0' '1' '0' '3'
'0' '3' '0' '0' }
def progsubnet : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
mov %r2, 0xe
ldxh %r3, [%r1+12]
jne %r3, 0x81, 3
mov %r2, 0x12
ldxh %r3, [%r1+16]
and %r3, 0xffff
jne %r3, 0x8, 5
add %r1, %r2
mov %r0, 0x1
ldxw %r1, [%r1+16]
and %r1, 0xffffff
jeq %r1, 0x1a8c0, exit
mov %r0, 0x0
exit
result
0x1
}
-- End of file: subnet.lean

-- Start of file: swap16.lean
------------------------------

def memoryswap16 :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progswap16 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r0, 0x8877665544332211
swap16 %r0
exit
result
0x1122
}
-- End of file: swap16.lean

-- Start of file: swap32.lean
------------------------------

def memoryswap32 :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progswap32 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r0, 0x8877665544332211
swap32 %r0
exit
result
0x11223344
}
-- End of file: swap32.lean

-- Start of file: swap64.lean
------------------------------

def memoryswap64 :=
createStackMemory 0 emptyMemory
{mem|
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' }
def progswap64 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
lddw %r0, 0x8877665544332211
swap64 %r0
exit
result
0x1122334455667788
}
-- End of file: swap64.lean

-- Programs List
def prog_list := [
progadd,
progadd64,
progalu_arith,
progalu_bit,
progalu64_arith,
progalu64_bit,
progarsh32_imm_high,
progarsh32_imm_neg,
progarsh32_imm,
progarsh32_reg_high,
progarsh32_reg_neg,
progarsh32_reg,
progarsh64_imm_high,
progarsh64_imm_neg,
progarsh64_imm,
progarsh64_reg_high,
progarsh64_reg_neg,
progarsh64_reg,
progbe16_high,
progbe16,
progbe32_high,
progbe32,
progbe64,
progcallx,
progcall_local,
progcall_unwind_fail,
progdiv32_zero_reg_2,
progdiv32_zero_reg,
progdiv32_high_divisor,
progdiv32_imm,
progdiv32_reg,
progdiv64_zero_reg,
progdiv64_imm,
progdiv64_negative_imm,
progdiv64_negative_reg,
progdiv64_reg,
progexit_not_last,
progexit,
progj_signed_imm,-- 38
progja32,
progjeq_imm,
progjeq_reg,
progjeq32_imm,
progjeq32_reg,
progjge_imm,
progjge_reg,
progjge32_imm,
progjge32_reg,
progjgt_imm,
progjgt_reg,
progjgt32_imm,
progjgt32_reg,
progjit_bounce,
progjle_imm,
progjle_reg,
progjle32_imm,
progjle32_reg,
progjlt_imm,
progjlt_reg,
progjlt32_imm,
progjlt32_reg,
progjne_reg,
progjne32_imm,
progjne32_reg,
progjset_imm,
progjset_reg,
progjset32_imm,
progjset32_reg,
progjsge_imm,
progjsge_reg,
progjsge32_imm,
progjsge32_reg,
progjsgt_imm,
progjsgt_reg,
progjsgt32_imm,
progjsgt32_reg,
progjsle_imm,
progjsle_reg,
progjsle32_imm,
progjsle32_reg,
progjslt_imm,
progjslt_reg,
progjslt32_imm,
progjslt32_reg,
proglddw,
proglddw2,
progldxb_all,
progldxb,
progldxdw,
progldxh_all,
progldxh_all2,
progldxh_same_reg,
progldxh,
progldxw_all,
progldxw,
progle16_high,
progle16,
progle32_high,
progle32,
progle64,
proglsh32_imm_high,
proglsh32_imm_neg,
proglsh32_imm,
proglsh32_reg_high,
proglsh32_reg_neg,
proglsh32_reg,
proglsh64_imm_high,
proglsh64_imm_neg,
proglsh64_imm,
proglsh64_reg_high,
proglsh64_reg_neg,
proglsh64_reg,
progmem_len, -- 112
progmod_zero_reg,
progmod,
progmod32,
progmod64_zero_reg,
progmod64,
progmov,
progmov64_sign_extend,
progmov64,
progmovsx1632_reg,
progmovsx1664_reg,
progmovsx3264_reg,
progmovsx832_reg,
progmovsx864_reg,
progmul32_imm,
progmul32_intmin_negone_imm,
progmul32_intmin_negone_reg,
progmul32_reg_overflow,
progmul32_reg,
progmul64_imm,
progmul64_intmin_negone_imm,
progmul64_intmin_negone_reg,
progmul64_reg,
progneg,
progneg32_intmin_imm,
progneg32_intmin_reg,
progneg64_intmin_imm,
progneg64_intmin_reg,
progneg64,
progrsh32_imm_high,
progrsh32_imm_neg,
progrsh32_imm,
progrsh32_reg_high,
progrsh32_reg_neg,
progrsh32_reg,
progrsh64_imm_high,
progrsh64_imm_neg,
progrsh64_imm,
progrsh64_reg_high,
progrsh64_reg_neg,
progrsh64_reg,
progsdiv32_zero_imm,
progsdiv32_zero_reg,
progsdiv32_imm,
progsdiv32_intmin_negone_imm,
progsdiv32_intmin_negone_reg,
progsdiv32_reg,
progsdiv64_zero_imm,
progsdiv64_zero_reg,
progsdiv64_imm,
progsdiv64_intmin_negone_imm,
progsdiv64_intmin_negone_reg,
progsdiv64_reg,
progsmod32_intmin_negone_imm,
progsmod32_intmin_negone_reg,
progsmod32_neg_neg_imm,
progsmod32_neg_neg_reg,
progsmod32_neg_pos_imm,
progsmod32_neg_pos_reg,
progsmod32_neg_zero_imm,
progsmod32_neg_zero_reg,
progsmod32_pos_neg_imm,
progsmod32_pos_neg_reg,
progsmod64_intmin_negone_imm,
progsmod64_intmin_negone_reg,
progsmod64_neg_neg_imm,
progsmod64_neg_neg_reg,
progsmod64_neg_pos_imm,
progsmod64_neg_pos_reg,
progsmod64_neg_zero_imm,
progsmod64_neg_zero_reg,
progsmod64_pos_neg_imm,
progsmod64_pos_neg_reg,
progstack,
progstb,
progstdw,
progsth,
progstw,
progstxb_all,
progstxb_all2,
progstxb_chain,
progstxb,
progstxdw,
progstxh,
progstxw,
progsubnet,
progswap16,
progswap32,
progswap64
]

-- Memory Stack List
def memory_list := [
memoryadd,
memoryadd64,
memoryalu_arith,
memoryalu_bit,
memoryalu64_arith,
memoryalu64_bit,
memoryarsh32_imm_high,
memoryarsh32_imm_neg,
memoryarsh32_imm,
memoryarsh32_reg_high,
memoryarsh32_reg_neg,
memoryarsh32_reg,
memoryarsh64_imm_high,
memoryarsh64_imm_neg,
memoryarsh64_imm,
memoryarsh64_reg_high,
memoryarsh64_reg_neg,
memoryarsh64_reg,
memorybe16_high,
memorybe16,
memorybe32_high,
memorybe32,
memorybe64,
memorycallx,
memorycall_local,
memorycall_unwind_fail,
memorydiv32_zero_reg_2,
memorydiv32_zero_reg,
memorydiv32_high_divisor,
memorydiv32_imm,
memorydiv32_reg,
memorydiv64_zero_reg,
memorydiv64_imm,
memorydiv64_negative_imm,
memorydiv64_negative_reg,
memorydiv64_reg,
memoryexit_not_last,
memoryexit,
memoryj_signed_imm,
memoryja32,
memoryjeq_imm,
memoryjeq_reg,
memoryjeq32_imm,
memoryjeq32_reg,
memoryjge_imm,
memoryjge_reg,
memoryjge32_imm,
memoryjge32_reg,
memoryjgt_imm,
memoryjgt_reg,
memoryjgt32_imm,
memoryjgt32_reg,
memoryjit_bounce,
memoryjle_imm,
memoryjle_reg,
memoryjle32_imm,
memoryjle32_reg,
memoryjlt_imm,
memoryjlt_reg,
memoryjlt32_imm,
memoryjlt32_reg,
memoryjne_reg,
memoryjne32_imm,
memoryjne32_reg,
memoryjset_imm,
memoryjset_reg,
memoryjset32_imm,
memoryjset32_reg,
memoryjsge_imm,
memoryjsge_reg,
memoryjsge32_imm,
memoryjsge32_reg,
memoryjsgt_imm,
memoryjsgt_reg,
memoryjsgt32_imm,
memoryjsgt32_reg,
memoryjsle_imm,
memoryjsle_reg,
memoryjsle32_imm,
memoryjsle32_reg,
memoryjslt_imm,
memoryjslt_reg,
memoryjslt32_imm,
memoryjslt32_reg,
memorylddw,
memorylddw2,
memoryldxb_all,
memoryldxb,
memoryldxdw,
memoryldxh_all,
memoryldxh_all2,
memoryldxh_same_reg,
memoryldxh,
memoryldxw_all,
memoryldxw,
memoryle16_high,
memoryle16,
memoryle32_high,
memoryle32,
memoryle64,
memorylsh32_imm_high,
memorylsh32_imm_neg,
memorylsh32_imm,
memorylsh32_reg_high,
memorylsh32_reg_neg,
memorylsh32_reg,
memorylsh64_imm_high,
memorylsh64_imm_neg,
memorylsh64_imm,
memorylsh64_reg_high,
memorylsh64_reg_neg,
memorylsh64_reg,
memorymem_len,
memorymod_zero_reg,
memorymod,
memorymod32,
memorymod64_zero_reg,
memorymod64,
memorymov,
memorymov64_sign_extend,
memorymov64,
memorymovsx1632_reg,
memorymovsx1664_reg,
memorymovsx3264_reg,
memorymovsx832_reg,
memorymovsx864_reg,
memorymul32_imm,
memorymul32_intmin_negone_imm,
memorymul32_intmin_negone_reg,
memorymul32_reg_overflow,
memorymul32_reg,
memorymul64_imm,
memorymul64_intmin_negone_imm,
memorymul64_intmin_negone_reg,
memorymul64_reg,
memoryneg,
memoryneg32_intmin_imm,
memoryneg32_intmin_reg,
memoryneg64_intmin_imm,
memoryneg64_intmin_reg,
memoryneg64,
memoryrsh32_imm_high,
memoryrsh32_imm_neg,
memoryrsh32_imm,
memoryrsh32_reg_high,
memoryrsh32_reg_neg,
memoryrsh32_reg,
memoryrsh64_imm_high,
memoryrsh64_imm_neg,
memoryrsh64_imm,
memoryrsh64_reg_high,
memoryrsh64_reg_neg,
memoryrsh64_reg,
memorysdiv32_zero_imm,
memorysdiv32_zero_reg,
memorysdiv32_imm,
memorysdiv32_intmin_negone_imm,
memorysdiv32_intmin_negone_reg,
memorysdiv32_reg,
memorysdiv64_zero_imm,
memorysdiv64_zero_reg,
memorysdiv64_imm,
memorysdiv64_intmin_negone_imm,
memorysdiv64_intmin_negone_reg,
memorysdiv64_reg,
memorysmod32_intmin_negone_imm,
memorysmod32_intmin_negone_reg,
memorysmod32_neg_neg_imm,
memorysmod32_neg_neg_reg,
memorysmod32_neg_pos_imm,
memorysmod32_neg_pos_reg,
memorysmod32_neg_zero_imm,
memorysmod32_neg_zero_reg,
memorysmod32_pos_neg_imm,
memorysmod32_pos_neg_reg,
memorysmod64_intmin_negone_imm,
memorysmod64_intmin_negone_reg,
memorysmod64_neg_neg_imm,
memorysmod64_neg_neg_reg,
memorysmod64_neg_pos_imm,
memorysmod64_neg_pos_reg,
memorysmod64_neg_zero_imm,
memorysmod64_neg_zero_reg,
memorysmod64_pos_neg_imm,
memorysmod64_pos_neg_reg,
memorystack,
memorystb,
memorystdw,
memorysth,
memorystw,
memorystxb_all,
memorystxb_all2,
memorystxb_chain,
memorystxb,
memorystxdw,
memorystxh,
memorystxw,
memorysubnet,
memoryswap16,
memoryswap32,
memoryswap64
]

def evalPrograms (progs : List TestEval) (mems : List MemorySpace) : List Bool :=
  match progs with
  | p :: ps =>
    match mems with
    | m :: ms => (exeConformanceCompareResult p m) :: (evalPrograms ps ms)
    | [] => []
  | [] => []

#eval "Comparison of the obtained output with the expected output:"
#eval evalPrograms prog_list memory_list

def contFalse (list : List Bool) (cont : ℕ ) : List ℕ :=
  match list with
  | false :: xs => cont :: contFalse xs (cont+1)
  | true  :: xs => contFalse xs (cont+1)
  | [] => []

#eval "Output indicating which programs returned values differing from the expected output:"
#eval contFalse (evalPrograms prog_list memory_list) 0
