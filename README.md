Computer Organization - Spring 2024
==============================================================
## Iran Univeristy of Science and Technology
## Assignment 1: Assembly code execution on phoeniX RISC-V core

- Name: fateme ackbari kalhori
- Team Members: fateme ackbari kalhori, mohammad erfan mahtabi, seyed mohammad reza hedayati
- Student ID: 99411119
- Date: 2024/05/22

## Report

### Quicksort in RISC-V Assembly

#### Overview
This RISC-V assembly program implements the quicksort algorithm to sort an array of integers. The quicksort algorithm is a highly efficient sorting algorithm and works by partitioning an array into two halves, then recursively sorting each half.

#### Program Structure
The program is organized into the following main sections:
1. **Initialization**: Setting up the stack pointer, loading initial values, and preparing the array to be sorted.
2. **Main Execution**: Calling the `QUICKSORT` function and then exiting the program.
3. **Quicksort Function**: The implementation of the quicksort algorithm.
4. **Partition Function**: A helper function used by quicksort to partition the array.
5. **Exit**: Loading the sorted array into registers and halting the program.

#### Detailed Explanation

1. **Initialization**:
    - The stack pointer is adjusted to create space for the program's needs.
    - Registers `a0` to `a5` are initialized with values. Specifically, an array is loaded into memory at address `a0`, with values `[5, 4, 3, 2, 1]`.
    - The start (`a1`) and end (`a2`) indices of the array are set to `0` and `4`, respectively.

    ```assembly
    addi sp, sp, 1000
    li a0, 0
    li s10, -1
    li s11, 5
    ...
    li a1, 0 # start
    li a2, 4 # end
    ```

2. **Main Execution**:
    - The `QUICKSORT` function is called to sort the array.
    - The program then jumps to the `EXIT` label to terminate.

    ```assembly
    jal ra, QUICKSORT
    jal ra, EXIT
    ```

3. **Quicksort Function**:
    - The function starts by saving registers and initializing local variables.
    - The base case for recursion is checked: if the start index is greater than or equal to the end index, the function returns.
    - The `PARTITION` function is called to partition the array.
    - The `QUICKSORT` function is recursively called on the left and right sub-arrays.

    ```assembly
    QUICKSORT:
    addi sp, sp, -20
    ...
    jal ra, PARTITION
    ...
    jal ra, QUICKSORT  # quicksort(arr, start, pi - 1);
    ...
    jal ra, QUICKSORT  # quicksort(arr, pi + 1, end);
    ```

4. **Partition Function**:
    - This function partitions the array around a pivot element.
    - It places elements smaller than the pivot to its left and larger elements to its right.
    - The function uses a loop to swap elements as needed to maintain the partitioning.

    ```assembly
    PARTITION:
    addi sp, sp, -4
    ...
    lw t0, 0(t0)     # pivot = arr[end]
    ...
    LOOP:
    BEQ t2, a2, LOOP_DONE   # while (j < end)
    ...
    SWAP:
    ...
    ```

5. **Exit**:
    - The sorted array is loaded into registers `x21` to `x25`.
    - The program halts with an `ebreak` instruction.

    ```assembly
    EXIT:
    lw x21,0(a0)
    lw x22,4(a0)
    lw x23,8(a0)
    lw x24,12(a0)
    lw x25,16(a0)
    ebreak
    ```
![Quicksort](https://github.com/Uvthk/phoeniX/blob/main/images/quicksort.png)

### Integer Square Root Algorithm in RISC-V Assembly

#### Overview

This repository contains a RISC-V assembly implementation of an algorithm to calculate the integer square root of a given non-negative integer. The integer square root of a number \( n \) is the largest integer \( x \) such that \( x^2 \leq n \).

#### Algorithm Description

The algorithm implemented is a simple iterative method to find the integer square root. It works by incrementing a counter and checking its square against the input number until the square exceeds the input number. The counter is then decremented to provide the correct integer square root.

#### Assembly Code

The provided RISC-V assembly code for calculating the integer square root is as follows:

```assembly
li a0, 13    # a = 13
li t0, 0     # j = 0

LOOP:
mul t1, t0, t0      # i = j*j
bgt t1, a0, DONE    # if(i > a)
addi t0, t0, 1      # j++
beq x0, x0, LOOP    # back to the LOOP
DONE:
addi t0, t0, -1     # it is the answer
ebreak
```

##### Explanation

1. **Initialization**:
    - `li a0, 13`: Load the integer 13 into register `a0`. This is the input number for which we want to find the integer square root.
    - `li t0, 0`: Initialize register `t0` to 0. This will be used as our counter (`j`).

2. **Main Loop** (`LOOP`):
    - `mul t1, t0, t0`: Calculate the square of `t0` and store it in `t1`.
    - `bgt t1, a0, DONE`: If the square (`t1`) is greater than the input number (`a0`), jump to the `DONE` label.
    - `addi t0, t0, 1`: Increment the counter (`t0`) by 1.
    - `beq x0, x0, LOOP`: Unconditionally jump back to the `LOOP` label to repeat the process.

3. **Completion** (`DONE`):
    - `addi t0, t0, -1`: Decrement the counter (`t0`) by 1, as the last increment made the square exceed the input number.
    - `ebreak`: End the program execution.

##### Usage

To run this code, you need a RISC-V simulator or a RISC-V compatible processor. The input number can be modified by changing the value loaded into `a0`.

##### Example

For the given code, the input number is 13. The integer square root of 13 is 3, since \( 3^2 = 9 \) and \( 4^2 = 16 \) which exceeds 13.

![Int_sqrt](https://github.com/Uvthk/phoeniX/blob/main/images/int_sqrt.png)
