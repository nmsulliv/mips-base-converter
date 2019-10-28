.globl main
.data

	prompt: .asciiz "Input: "
	message: .asciiz "\nOutput: "
	str: .space 32 # saves space for 32 bytes

.text

main:
	li $v0, 4 					#prompts the instructions to the user 
	la $a0, prompt
	syscall