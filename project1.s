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
	
	li $v0, 8					#get the number of characters to read from input 
	la $a0, str
	li $a1, 11 			
	syscall 

	exit:
		li $v0, 10 				# exit program
		syscall