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

	addi $t0, $zero, 0				#initialize counter for the loop
	la $s0, str					#load the string into $s0
	
	get_char:					#loop for each char of the string
		beq $t0, 10, exit		#condition to check if it is the end of the string
		
		lb $t2, 0($s0)			#loads a character into $t2
		
	exit:
		li $v0, 10 				# exit program
		syscall