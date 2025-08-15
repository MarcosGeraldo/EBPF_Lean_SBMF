import «EBPFSpec».TestFunctions

set_option maxRecDepth 100000

------------------------------------------------------------------------------
/-
Only allow ARP packets:

         ldh [12]
         jne #0x806, drop -- Jump Not Equal
         ret #-1
         drop: ret #0
-/
-- Use %r1 as the Accumulator
-- Replace ret with exit
-- Swap labels for the Offset value
-- Inverted value due to peculiarities of the Conformance tests

def prog_only_arp : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxh %r1, [12]
mov32 %r0, 1
jne %r1, 0x0608, 1
exit
mov32 %r0, 0
exit
result
0x1
}
/-
#eval exeConformanceDebug prog_only_arp (inputPackgeGeneratorArp false) -- Exit R0 == 0
#eval exeConformanceDebug prog_only_arp (inputPackgeGeneratorArp true) -- Exit R0 == 1

#eval evaluateEbpfProg prog_only_arp (cratePackgesArp 30 70 12)
#eval evaluateEbpfProgCont prog_only_arp (cratePackgesArp 30 70 13)

-/

def numTests := 9000
def numAccept := 4500
def numSeeds := 10

#eval "Number of packets correctly evaluated by the Only_Arp program"
#eval evaluateEbpfProgContListSeeds prog_only_arp cratePackgesArp numAccept numTests 15 numSeeds

-------------------------------------------------------------------------------
/-
Only allow IPV4 packets:

         ldh [12]
         jne #0x8, drop -- Jump Not Equal
         ret #-1
         drop: ret #0
-/
def prog_only_IPV4 : TestEval :=
{exe|
# Copyright Big Switch Networks Inc
# SPDX_License_Identifier Apache_2_0
asm
ldxh %r1, [12]
mov32 %r0, 1
jne %r1, 0x0008, 1
exit
mov32 %r0, 0
exit
result
0x1
}

/-
#eval exeConformanceDebug prog_only_IPV4 (inputPackgeGeneratorIPv4 false 11) -- Exit R0 == 0
#eval exeConformanceDebug prog_only_IPV4 (inputPackgeGeneratorIPv4 true  11) -- Exit R0 == 1

#eval evaluateEbpfProg prog_only_IPV4 (cratePackgesIPV4 30 70 12)
#eval evaluateEbpfProgCont prog_only_IPV4 (cratePackgesIPV4 30 70 13)
-/

#eval "Number of packets correctly evaluated by the Only_IPV4 program"
#eval evaluateEbpfProgContListSeeds prog_only_IPV4 cratePackgesIPV4 numAccept numTests 15 numSeeds
