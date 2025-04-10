# AssemblyCodes

A collection of 68000 assembly language programs for learning and demonstration purposes.

## Repository Contents

This repository contains several 68000 assembly language programs that demonstrate fundamental programming concepts:

- **Factorial.asm**: A program that calculates the factorial of a user-input integer.
- **CountEven.asm**: A program that reads 10 integers from user input and counts how many are even numbers.
- **CountVowels.asm**: A program that counts the number of vowels in a user-input string.

## Running the Programs

These programs are designed to run with an M68000 simulator. This repository includes:

- IDE68K22.exe
- IDE68K30.exe

These are different versions of the IDE68K simulator that can be used to assemble and run the programs.

## Program Descriptions

### Factorial.asm
Prompts the user to enter an integer and calculates its factorial (n!). The factorial of a number is the product of all positive integers less than or equal to n.

### CountEven.asm
Asks the user to input 10 integers (less than 255) and counts how many of these numbers are even. It demonstrates array storage and conditional checking.

### CountVowels.asm
Prompts the user to enter a string (up to 30 characters) and counts the number of vowels (a, e, i, o, u, y) in the input string.

## Assembly Language Features Demonstrated

- Input/output operations
- Looping constructs
- Conditional branching
- Memory manipulation
- Basic arithmetic operations
- Array handling
- String processing

## Development Environment

These programs are written for the Motorola 68000 processor architecture and can be assembled and executed using the IDE68K simulator included in this repository.