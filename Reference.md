# TRAP Reference for IDE68K30

This document provides a quick reference guide for common TRAP operations and instructions used with the IDE68K30 simulator for Motorola 68000 assembly programming.

## TRAP #15 Operations

The TRAP #15 instruction is used for system calls in the IDE68K simulator. Different operations are selected by placing a value in the following `dc.w` directive:

| Operation Code | Description | Usage |
|---------------|-------------|-------|
| `dc.w 0` | Exit program | Terminates program execution |
| `dc.w 5` | Output integer | Displays integer value in D0 register |
| `dc.w 6` | Input integer | Gets integer input from user, stored in D0 |
| `dc.w 7` | Output string | Displays null-terminated string pointed to by A0 |
| `dc.w 8` | Input string | Gets string input from user, stored at buffer pointed to by A0 |

Example:
```asm
    lea     prompt,A0      ; Load address of prompt string into A0
    trap    #15            ; Call system function
    dc.w    7              ; Display string pointed by A0
    
    trap    #15            ; Call system function
    dc.w    6              ; Get integer input into D0
```

## Common Branch Instructions

Branch instructions control program flow based on condition code flags:

| Instruction | Description | Condition |
|------------|-------------|-----------|
| `BRA` | Branch Always | Unconditional branch |
| `BEQ` | Branch if Equal | Z=1 (Zero flag set) |
| `BNE` | Branch if Not Equal | Z=0 (Zero flag clear) |
| `BGT` | Branch if Greater Than | Z=0 and N=0 |
| `BLT` | Branch if Less Than | Z=0 and N=1 |
| `BGE` | Branch if Greater or Equal | (Z=1 or Z=0) and N=0 |
| `BLE` | Branch if Less or Equal | (Z=1 or Z=0) and N=1 |
| `BCC` | Branch if Carry Clear | C=0 |
| `BCS` | Branch if Carry Set | C=1 |

Example:
```asm
    cmp.b   D0,D1          ; Compare D0 and D1
    beq     equal_branch   ; Branch if equal
    blt     less_branch    ; Branch if D1 < D0
```

## Common Bit Operations

Operations for manipulating and testing bits:

| Instruction | Description | Notes |
|------------|-------------|-------|
| `BTST` | Bit Test | Tests a specific bit and sets Z flag accordingly |
| `LSR` | Logical Shift Right | Inserts 0 from left, shifts right, last bit to C |
| `ASR` | Arithmetic Shift Right | Duplicates sign bit, shifts right, last bit to C |
| `LSL` | Logical Shift Left | Shifts left, inserts 0 from right, last bit to C |
| `ASL` | Arithmetic Shift Left | Same as LSL for the 68000 |

Example for checking if a number is even using BTST:
```asm
    BTST    #0,D0          ; Test bit 0 (LSB)
    beq     even_number    ; If bit 0 is 0, number is even
```

## Common Define Directives

Directives for defining data in memory:

| Directive | Description | Size Suffixes |
|-----------|-------------|---------------|
| `DS` | Define Storage | `.b` (byte), `.w` (word), `.l` (longword) |
| `DC` | Define Constant | `.b` (byte), `.w` (word), `.l` (longword) |

Example:
```asm
prompt  dc.b    "Please enter an integer: ",0  ; Null-terminated string
value   ds.w    1                              ; Reserve 2 bytes
array   ds.b    10                             ; Reserve 10 bytes
```

## Program Structure

68000 assembly programs typically use this organization:

```asm
        org     $10000          ; Start of code section
        
        ; Main program code goes here
        
        trap    #15             ; Exit program
        dc.w    0
        
        org     $11000          ; Start of data section
        
        ; Data declarations go here
```

## Common Register Usage

- **D0-D7**: Data registers (D0 often used for function results)
- **A0-A7**: Address registers (A7 is the stack pointer)

## Basic Addressing Modes

| Mode | Example | Description |
|------|---------|-------------|
| Register Direct | `move.b D1,D2` | Data in register |
| Address Register Indirect | `move.b (A0),D0` | Data at address in register |
| Immediate | `move.b #5,D0` | Constant value |
| Address Register Indirect with Post-increment | `move.b (A0)+,D0` | Use address then increment |
| Address Register Indirect with Pre-decrement | `move.b -(A0),D0` | Decrement address then use |

## Example Techniques

### Loop Construction
```asm
    move.l  #10,D3          ; D3 is used as the loop counter
loop:
    ; Body of loop goes here
    sub.l   #1,D3           ; Decrement counter
    bne     loop            ; Loop if counter not zero
```

### Array Processing
```asm
    LEA     ARRAY,A1        ; Load array address
loop:
    move.b  (A1),D1         ; Get current element
    ; Process element in D1
    ADDA    #1,A1           ; Move to next element
    ; Continue or exit loop
```

### String Processing
```asm
    lea     mystr,A0        ; Point to start of string
loop:
    move.b  (A0),D1         ; Get current character
    cmp.b   #0,D1           ; Check for null terminator
    beq     done            ; Exit if end of string
    ; Process character in D1
    adda    #1,A0           ; Move to next character
    bra     loop            ; Continue loop
done:
    ; String processing complete
```