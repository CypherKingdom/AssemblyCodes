# AssemblyCodes

A collection of 68000 assembly language programs for learning and demonstration purposes.

## Repository Contents

This repository contains several 68000 assembly language programs that demonstrate fundamental programming concepts:

- **add_vars.asm**: A program that adds two variables and displays the result.
- **array_min_sum.asm**: A program that processes a predefined array to find the minimum value and calculate the sum.
- **array_user_input.asm**: A program that gets 5 integers from the user, finds the minimum value, and calculates their sum.
- **count_even_nums.asm**: A program that reads 10 integers from user input and counts how many are even numbers.
- **count_vowels.asm**: A program that counts the number of vowels in a user-input string.
- **factorial_calc.asm**: A program that calculates the factorial of a user-input integer.
- **find_min.asm**: A program that gets two inputs from the user and finds the minimum value.
- **gcd_calc.asm**: A program that calculates the Greatest Common Divisor (GCD) of two integers.
- **multi_func.asm**: A menu-driven program that offers multiple functions (Fibonacci sequence, factorial calculation, and sign checking).
- **palindrome.asm**: A program that checks if a word is a palindrome (reads the same forward and backward).
- **parity_asr.asm**: A program that determines if a number is even or odd using the ASR (Arithmetic Shift Right) instruction.
- **parity_btst.asm**: A program that determines if a number is even or odd using the BTST (Bit Test) instruction.
- **parity_lsr.asm**: A program that determines if a number is even or odd using the LSR (Logical Shift Right) instruction.
- **str_replace.asm**: A program that gets a string from the user and replaces all occurrences of 'e' with '_'.
- **sum_odd_nums.asm**: A program that calculates the sum of odd numbers between 10 and 25.

## Reference Documentation

The repository also includes:

- **TRAP_Reference.md**: A comprehensive reference guide for TRAP operations and common assembly instructions for the IDE68K30 simulator.

## Running the Programs

These programs are designed to run with an M68000 simulator. This repository includes:

- IDE68K22.exe
- IDE68K30.exe

These are different versions of the IDE68K simulator that can be used to assemble and run the programs.

## Program Descriptions

### add_vars.asm
Adds two predefined byte variables and stores the result in a word variable, demonstrating how to handle potential overflow in arithmetic operations.

### array_min_sum.asm
Processes a predefined array to find the minimum value and calculate the sum of all elements, demonstrating basic array iteration techniques.

### array_user_input.asm
Gets 5 integers from the user, stores them in an array, finds the minimum value, and calculates the sum, demonstrating user input and array processing.

### count_even_nums.asm
Asks the user to input 10 integers (less than 255) and counts how many of these numbers are even. It demonstrates array storage and conditional checking.

### count_vowels.asm
Prompts the user to enter a string (up to 30 characters) and counts the number of vowels (a, e, i, o, u, y) in the input string.

### factorial_calc.asm
Prompts the user to enter an integer and calculates its factorial (n!). The factorial of a number is the product of all positive integers less than or equal to n.

### find_min.asm
Gets two integers from the user and determines which is smaller, demonstrating basic comparison operations.

### gcd_calc.asm
Calculates the Greatest Common Divisor of two integers using Euclid's algorithm, demonstrating iterative problem-solving.

### multi_func.asm
A menu-driven program that offers three different functions:
1. Fibonacci sequence calculation: Calculates the n-th Fibonacci number based on user input
2. Factorial calculation: Computes the factorial of a user-provided integer
3. Sign checking: Determines if a user-input number is positive or negative

This program demonstrates menu systems, user input handling, and multiple implementations of algorithms in a single program.

### palindrome.asm
Determines if a user-input word reads the same forwards and backwards, demonstrating string comparison techniques.

### parity_asr.asm
Uses the Arithmetic Shift Right (ASR) instruction to determine if a user-input number is even or odd. ASR preserves the sign bit when shifting.

### parity_btst.asm
Uses the Bit Test (BTST) instruction to determine if a user-input number is even or odd by testing the least significant bit.

### parity_lsr.asm
Uses the Logical Shift Right (LSR) instruction to determine if a user-input number is even or odd, demonstrating bit manipulation.

### str_replace.asm
Gets a string from the user and replaces all occurrences of the letter 'e' with underscore ('_'), demonstrating string manipulation.

### sum_odd_nums.asm
Calculates the sum of all odd numbers in the range from 10 to 25, demonstrating conditional logic and looping.

## Assembly Language Features Demonstrated

- Input/output operations using TRAP #15
- Looping constructs (loops with different termination conditions)
- Conditional branching
- Memory manipulation
- Basic arithmetic operations
- Array handling and processing
- String processing and manipulation
- Bit manipulation techniques (BTST, LSR, ASR)
- Different data types and sizes (byte, word, longword)
- Address register indirect addressing with post-increment and pre-decrement
- Algorithm implementations (GCD, palindrome checking, factorial)
- Menu-driven program structures
- Multiple algorithms in a single program

## Development Environment

These programs are written for the Motorola 68000 processor architecture and can be assembled and executed using the IDE68K simulator included in this repository. Refer to the TRAP_Reference.md file for detailed information about TRAP operations and commonly used instructions.