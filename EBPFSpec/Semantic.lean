import Mathlib.Data.Nat.Defs

-- Comando para definir o tamanho maximo da arvore de recursão
set_option maxRecDepth 100000

--------->>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<
--------->>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<
--------->>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<
--------->>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<
-- Inicio da semantica do Ebpf

-------Memoria de registradores do eBPF
structure Registers where
  r0 : Nat
  r1 : Nat
  r2 : Nat
  r3 : Nat
  r4 : Nat
  r5 : Nat
  r6 : Nat
  r7 : Nat
  r8 : Nat
  r9 : Nat
  r10 : Nat
deriving Repr

-------------------Definição da Pilha de Memoria
structure MemorySpace where
  data : Fin 512 → Nat
/-
inductive StackWord
  | nil : StackWord
  | mk : Char → Char → StackWord → StackWord
deriving Repr
-/

inductive Hex : Type
| x0  : Hex
| x1  : Hex
| x2  : Hex
| x3  : Hex
| x4  : Hex
| x5  : Hex
| x6  : Hex
| x7  : Hex
| x8  : Hex
| x9  : Hex
| xA : Hex
| xB : Hex
| xC : Hex
| xD : Hex
| xE : Hex
| xF : Hex
deriving Repr, DecidableEq

inductive StackWord
  | nil : StackWord
  | mk : Hex  → Hex → StackWord → StackWord
deriving Repr

inductive Immediate : Type
| mk : ℕ  → Immediate
| mkN : ℕ → Immediate
deriving Repr, DecidableEq

inductive Offset: Type
| mk : ℕ → Offset
| mkN : ℕ → Offset
| Exit : Offset
deriving Repr, DecidableEq

inductive RegisterCode : Type
| r0  : RegisterCode
| r1  : RegisterCode
| r2  : RegisterCode
| r3  : RegisterCode
| r4  : RegisterCode
| r5  : RegisterCode
| r6  : RegisterCode
| r7  : RegisterCode
| r8  : RegisterCode
| r9  : RegisterCode
| r10 : RegisterCode
| rP  : RegisterCode
deriving Repr

inductive Content : Type
| mk: ℕ → Content
deriving Repr

inductive Lsb: Type
| bpf_ld : Lsb
| bpf_ldx : Lsb
| bpf_st : Lsb
| bpf_stx : Lsb
| bpf_alu : Lsb
| bpf_jmp : Lsb
| bpf_jmp32 : Lsb
| bpf_alu64 : Lsb
deriving Repr, DecidableEq

inductive Msb : Type
| bpf_add : Msb
| bpf_sub : Msb
| bpf_mul : Msb
| bpf_div : Msb
| bpf_sdiv : Msb
| bpf_end : Msb
| bpf_mod : Msb
| bpf_smod : Msb
| bpf_neg : Msb
| bpf_mov : Msb
| bpf_movsx1632 : Msb
| bpf_movsx1664 : Msb
| bpf_movsx3264 : Msb
| bpf_movsx832 : Msb
| bpf_movsx864 : Msb
| bpf_call_local : Msb
| bpf_ja : Msb
| bpf_jeq : Msb
| bpf_jge : Msb
| bpf_jle : Msb
| bpf_jne : Msb
| bpf_jlt : Msb
| bpf_jgt : Msb
| bpf_jset : Msb
| bpf_jsge : Msb
| bpf_jsgt : Msb
| bpf_jsle : Msb
| bpf_jslt : Msb
| bpf_jneq : Msb
| bpf_ldh : Msb
| bpf_ldxb : Msb
| bpf_ldxh : Msb
| bpf_ldxw : Msb
| bpf_lddw : Msb
| bpf_ldxdw : Msb
| bpf_ldxdh : Msb
| bpf_and : Msb
| bpf_or : Msb
| bpf_xor : Msb
| bpf_rsh : Msb
| bpf_lsh : Msb
| bpf_arsh : Msb
| bpf_be16 : Msb
| bpf_be32 : Msb
| bpf_be64 : Msb
| bpf_le16 : Msb
| bpf_le32 : Msb
| bpf_le64 : Msb
| bpf_swap16 : Msb
| bpf_swap32 : Msb
| bpf_swap64 : Msb
| bpf_stw : Msb
| bpf_sth : Msb
| bpf_stb : Msb
| bpf_stdw : Msb
| bpf_stxw : Msb
| bpf_stxh : Msb
| bpf_stxb : Msb
| bpf_stxdw : Msb
deriving Repr

inductive Source : Type
| bpf_k : Source
| bpf_x : Source
deriving Repr, DecidableEq

inductive SourceReg: Type
| mk : RegisterCode →  SourceReg
deriving Repr

inductive DestinationReg: Type
| mk : RegisterCode → DestinationReg
deriving Repr

inductive OpCode: Type
| Eof : OpCode
| mk : Msb → Source → Lsb → OpCode
deriving Repr

inductive Word : Type
| mk : Immediate → Offset → SourceReg → DestinationReg → OpCode → Word
deriving Repr

inductive Instructions : Type
| Nil : Word → Instructions
| Cons : Word → Instructions → Instructions
deriving Repr


inductive Comment: Type
| Nil : String → Comment
| Cons : String → Comment → Comment
deriving Repr

inductive Result: Type
| mk : ℕ → Result
deriving Repr

inductive TestEval: Type
| mk : Instructions → ℕ → TestEval
deriving Repr
