import «EBPFSpec».Syntax
import «EBPFSpec».Parser

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


-- Function that returns a character given a natural number
def charFromIndex (n : ℕ) : Char :=
  if n < 10 then
    Char.ofNat (n + 48)  -- '0' is ASCII 48
  else
    Char.ofNat (n - 10 + 97)  -- 'a' is ASCII 97

-- Function to "randomize" the values based on a seed
def generateChar (seed : ℕ) : Char :=
  charFromIndex (seed % 16)  -- 16 values between 0 - 9 and a - f

-- Function that, given a size and a seed, returns a list of hexadecimal characters
-- This list is used to populate the input packet
def generateRandomList (size : ℕ) (seed : ℕ) : List Char :=
  match size with
  | 0 => []
  | size' + 1 =>
      generateChar seed :: generateRandomList (size') (seed + 17)


-- Function that, given a list of characters, populates a memory space
def formatMemorySpace (input : List Char) : MemorySpace :=
  createStackMemoryCharList 0 emptyMemory input

-- Packet macros, here I can define any expected value
def ipv4 := ['0','8','0','0']--0x0800
def arp := ['0','8','0','6']--0x0806

-- Function that creates an Arp packet, other values are being randomized
def inputPackgeGeneratorArp ( valid : Bool ) (seed : ℕ ) : MemorySpace :=
  let macDestino := generateRandomList 12 seed
  let macOrigem := generateRandomList 12 seed
  let eth_type :=  if valid then arp
    else
        generateRandomList 8 8
  let ipV4Header := generateRandomList 40 seed
  let tcpHeader := generateRandomList 80 seed
  formatMemorySpace (macDestino ++ macOrigem ++ eth_type ++ ipV4Header ++ tcpHeader)

-- Function that creates an IPv4 packet, other values are being randomized
def inputPackgeGeneratorIPv4 ( valid : Bool ) (seed : ℕ ) : MemorySpace :=
  let macDestino := generateRandomList 12 seed
  let macOrigem := generateRandomList 12 seed
  let eth_type :=  if valid then ipv4
    else
        generateRandomList 8 8
  let ipV4Header := generateRandomList 40 seed
  let tcpHeader := generateRandomList 80 seed
  formatMemorySpace (macDestino ++ macOrigem ++ eth_type ++ ipV4Header ++ tcpHeader)

-- Function that, given a list of booleans, returns a list of Arp packets
-- Where for each boolean in the list it is defined whether the packet should be accepted or not
def inputPackgeGeneratorListArp (validList : List Bool ) (seed : ℕ ) : List MemorySpace:=
  match validList with
  | valid :: xs => inputPackgeGeneratorArp valid seed :: inputPackgeGeneratorListArp xs (seed + 7)
  | [] => []

-- Function that, given a list of booleans, returns a list of IPv4 packets
-- Where for each boolean in the list it is defined whether the packet should be accepted or not
def inputPackgeGeneratorListIPv4 (validList : List Bool ) (seed : ℕ ) : List MemorySpace:=
  match validList with
  | valid :: xs => inputPackgeGeneratorIPv4 valid seed :: inputPackgeGeneratorListIPv4 xs (seed + 7)
  | [] => []

-- Function that, given a count of valid packets and a total size,
-- creates a list of booleans defining the values for accepted or not accepted packets
def createBooleanList(valid n : ℕ) : List Bool :=
  match n with
  |n' + 1 =>
    match valid with
      | valid' + 1 => true :: createBooleanList valid' n'
      | 0 => false :: createBooleanList 0 n'
  |0 => []

-- Function that creates a list of ARP packets
-- and returns which are valid and which are not
def cratePackgesArp ( valid n : ℕ ) (seed : ℕ )  : List MemorySpace × List Bool :=
    let validList := createBooleanList valid n
    (inputPackgeGeneratorListArp validList seed, validList)

-- Function that creates a list of IPV4 packets
-- and returns which are valid and which are not
def cratePackgesIPV4 ( valid n : ℕ ) (seed : ℕ ) : List MemorySpace × List Bool :=
    let validList := createBooleanList valid n
    (inputPackgeGeneratorListIPv4 validList seed, validList)

-- Function that receives a program, a list of input packets
-- and compares the expected result with the obtained one
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

-- Function to "Unwrap" the return of createPackges
def evaluateEbpfProg (prog : TestEval) (input : List MemorySpace × List Bool) : List Bool :=
  match input with
  | (inputMemory, validList) => evalEbpfProg prog inputMemory validList

-- Function to "Unwrap" the return of createPackges
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
