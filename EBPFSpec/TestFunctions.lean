import «EBPFSpec».Syntax
import «EBPFSpec».Parser

def initialRegisters : Registers :=
  { r0 := 0, r1 := 0, r2 := 0, r3 := 0, r4 := 0
  , r5 := 0, r6 := 0, r7 := 0, r8 := 0, r9 := 0, r10 := 0 }

def exeConformance ( input : TestEval ) (stack : MemorySpace) : MemorySpace × Registers × Instructions :=
  match input with
  | TestEval.mk instructions _expectedResult =>
    let fuel := 1000
    let returnedResult := exeMain stack initialRegisters instructions fuel 0
    returnedResult

def exeConformanceDebug ( input : TestEval ) (stack : MemorySpace) : MemorySpace × Registers × Instructions × List ℕ :=
  match input with
  | TestEval.mk instructions _expectedResult =>
    let fuel := 1000
    let returnedResult := exeMainDebug stack initialRegisters instructions fuel 0 []
    returnedResult



--Função que cria retorna um char dado um natural
def charFromIndex (n : ℕ) : Char :=
  if n < 10 then
    Char.ofNat (n + 48)  -- '0' é ASCII 48
  else
    Char.ofNat (n - 10 + 97)  -- 'a' é ASCII 97

-- Função para "randomizar" os valore tendo uma seed como base
def generateChar (seed : ℕ) : Char :=
  charFromIndex (seed % 16)  -- 16 valores números entre 0 - 9 e a - f

--Função que dada um tanho e uma seed retorna uma lista de caracteres hexadecimal
-- Lista essa que é utilziada para popular o pacote de entrada
def generateRandomList (size : ℕ) (seed : ℕ) : List Char :=
  match size with
  | 0 => []
  | size' + 1 =>
      generateChar seed :: generateRandomList (size') (seed + 17)

--Função que dado uma lista de caracteres popula um espaço de memoria
def formatMemorySpace (input : List Char) : MemorySpace :=
  createStackMemoryCharList 0 emptyMemory input

--Macros do pacote, aqui posso definir qualquer valor esperado
def ipv4 := ['0','8','0','0']--0x0800
def arp := ['0','8','0','6']--0x0806

--Função que cria um pacote Arp, demais valores estão sendo randomizados
def inputPackgeGeneratorArp ( valid : Bool ) (seed : ℕ ) : MemorySpace :=
  let macDestino := generateRandomList 12 seed
  let macOrigem := generateRandomList 12 seed
  let eth_type :=  if valid then arp
    else
        generateRandomList 8 8
  let ipV4Header := generateRandomList 40 seed
  let tcpHeader := generateRandomList 80 seed
  formatMemorySpace (macDestino ++ macOrigem ++ eth_type ++ ipV4Header ++ tcpHeader)

--Função que cria um pacote IPv4, demais valores estão sendo randomizados
def inputPackgeGeneratorIPv4 ( valid : Bool ) (seed : ℕ ) : MemorySpace :=
  let macDestino := generateRandomList 12 seed
  let macOrigem := generateRandomList 12 seed
  let eth_type :=  if valid then ipv4
    else
        generateRandomList 8 8
  let ipV4Header := generateRandomList 40 seed
  let tcpHeader := generateRandomList 80 seed
  formatMemorySpace (macDestino ++ macOrigem ++ eth_type ++ ipV4Header ++ tcpHeader)

-- Função que dado uma lista de booleanos retorna uma lista de pacotes Arp
-- Onde para cada boleano da lista fica definido se o pacote deve ser aceito ou não
def inputPackgeGeneratorListArp (validList : List Bool ) (seed : ℕ ) : List MemorySpace:=
  match validList with
  | valid :: xs => inputPackgeGeneratorArp valid seed :: inputPackgeGeneratorListArp xs (seed + 7)
  | [] => []

-- Função que dado uma lista de booleanos retorna uma lista de pacotes IPv4
-- Onde para cada boleano da lista fica definido se o pacote deve ser aceito ou não
def inputPackgeGeneratorListIPv4 (validList : List Bool ) (seed : ℕ ) : List MemorySpace:=
  match validList with
  | valid :: xs => inputPackgeGeneratorIPv4 valid seed :: inputPackgeGeneratorListIPv4 xs (seed + 7)
  | [] => []

-- Função que dado uma contagem de pacotes validos e um tamanho total
-- Cria uma lista de boleanos definindo os valores para pacotes aceitos ou não
def createBooleanList(valid n : ℕ) : List Bool :=
  match n with
  |n' + 1 =>
    match valid with
      | valid' + 1 => true :: createBooleanList valid' n'
      | 0 => false :: createBooleanList 0 n'
  |0 => []

--Função que cria uma lista de pacotes ARP
--E retorna quais são validos e quais não pacote
def cratePackgesArp ( valid n : ℕ ) (seed : ℕ )  : List MemorySpace × List Bool :=
    let validList := createBooleanList valid n
    (inputPackgeGeneratorListArp validList seed, validList)

--Função que cria uma lista de pacotes IPV4
--E retorna quais são validos e quais não pacote
def cratePackgesIPV4 ( valid n : ℕ ) (seed : ℕ ) : List MemorySpace × List Bool :=
    let validList := createBooleanList valid n
    (inputPackgeGeneratorListIPv4 validList seed, validList)

-- Função que recebe um programa , uma lista de pacotes de entrada
-- E compara o resultado esperado com o obtido
def evalEbpfProg (prog : TestEval) (inputs : List MemorySpace) (validList : List Bool) : List Bool :=
  match inputs with
  | i :: is =>
    match validList with
      | v :: vs =>
        let (_retMemory, retVal, _inst) := exeConformance prog i
        match prog with
        | TestEval.mk _instr expectedVal => ((expectedVal == retVal.r0) == v) :: evalEbpfProg prog is vs
      |[]=> []
  | [] => []

def evalEbpfProgCont (prog : TestEval) (inputs : List MemorySpace) (validList : List Bool) : ℕ :=
  match inputs with
  | i :: is =>
    match validList with
      | v :: vs =>
        let (_retMemory, retVal, _inst) := exeConformance prog i
        match prog with
        | TestEval.mk _instr expectedVal => if (expectedVal == retVal.r0) == v
          then 1 + evalEbpfProgCont prog is vs
          else evalEbpfProgCont prog is vs
      |[]=> 0
  | [] => 0

def exeConformanceCompareResult (prog : TestEval) (inputs : MemorySpace) :=
  let (_retMemory, retVal, _inst) := exeConformance prog inputs
  match prog with
    | TestEval.mk _instr expectedVal => (expectedVal == retVal.r0)

-- Função para "Desembrulhar" o retorno do cratePackges
def evaluateEbpfProg (prog : TestEval) (input : List MemorySpace × List Bool) : List Bool :=
  match input with
  | (inputMemory, validList) => evalEbpfProg prog inputMemory validList

-- Função para "Desembrulhar" o retorno do cratePackges
def evaluateEbpfProgCont (prog : TestEval) (input : List MemorySpace × List Bool) : ℕ :=
  match input with
  | (inputMemory, validList) => evalEbpfProgCont prog inputMemory validList

def evaluateEbpfProgContListSeeds
  (prog : TestEval) (packetGenerator : ℕ → ℕ → ℕ → List MemorySpace × List Bool) (numAccept numtests initialSeed n : ℕ) : ℕ :=
  let input := packetGenerator numAccept numtests initialSeed
  match n with
     | n' + 1 =>
         evaluateEbpfProgCont prog input +
         evaluateEbpfProgContListSeeds prog packetGenerator numAccept numtests initialSeed n'
     | 0 => evaluateEbpfProgCont prog input
