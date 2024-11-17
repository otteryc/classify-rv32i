.globl argmax

.text
# =================================================================
# FUNCTION: Maximum Element First Index Finder
#
# Scans an integer array to find its maximum value and returns the
# position of its first occurrence. In cases where multiple elements
# share the maximum value, returns the smallest index.
#
# Arguments:
#   a0 (int *): Pointer to the first element of the array
#   a1 (int):  Number of elements in the array
#
# Returns:
#   a0 (int):  Position of the first maximum element (0-based index)
#
# Preconditions:
#   - Array must contain at least one element
#
# Error Cases:
#   - Terminates program with exit code 36 if array length < 1
# =================================================================
argmax:
    li t6, 1
    blt a1, t6, handle_error

    lw t0, 0(a0)

    li t1, 0
    li t2, 0
loop_start:
    beqz a1, epilogue
    lw t3, 0(a0)
    blt t3, t0, continue
    add t1, t2, x0
    add t0, t3, x0
    
continue:
    addi t2, t2, 1
    addi a0, a0, 4
    addi a1, a1, -1
    j loop_start

epilogue:
    add a0, t1, x0
    ret

handle_error:
    li a0, 36
    j exit
