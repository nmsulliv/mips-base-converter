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
		beq $t0, 10, exit			#condition to check if it is the end of the string
		
		lb $t2, 0($s0)				#loads a character into $t2
		
		addi $s0, $s0, 1			#increments address of the array by one for the next char
		addi $t0, $t0, 1			#increments the loop counter by one
		
		convert_char:
		ble $t2, 57, check_num_greater 
		ble $t2, 84, check_upcase_greater 


		check_num_greater:
			bge $t2, 48, convert_num_char	#if num is in range, convert num 
			j exit
			
		check_upcase_greater:
			bge $t2, 64, convert_upper_char	#if upcase is in range, convert char

		convert_num_char:
			addi $t2, $t2, -48 		#subtract 48 to get the true value
			j add_char
			
		convert_upper_char:
			addi $t2, $t2, -55		#subtract 55 to get the true value
			j add_char

		add_char:
			add $s1, $s1, $t2
			
			li $v0, 1				#for debugging
			la $a0, $s1
			syscall
	
			j get_char

	j get_char

	exit:
		li $v0, 10 				# exit program
		syscall