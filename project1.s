# calculation for base 
#02894357 % 11 = 4
#base: 26 + 4 = 30, β is 't' and Δ is 'T

.globl main
.data

	output: .asciiz "\n"
	str: .space 32 # saves space for 32 bytes

.text

main:
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
		ble $t2, 47, check_lorange_greater	#if the char is le, check to see if it is in range
		ble $t2, 57, check_num_greater 
		ble $t2, 64, check_midrange_greater
		ble $t2, 84, check_upcase_greater 
		ble $t2, 96, check_tmidrange_greater 
		ble $t2, 116, check_locase_greater
		ble $t2, 127, check_hirange_greater


		check_num_greater:
			bge $t2, 48, convert_num_char	#if num is in range, convert num 
			j exit
			
		check_upcase_greater:
			bge $t2, 65, convert_upper_char	#if upcase is in range, convert char
			j exit

		check_locase_greater:
			bge $t2, 97, convert_lower_char	#if locase is in range, convert char 
			j exit

		check_lorange_greater:
			bge $t2, 0, convert_out_range	#if out of range, make 0
			j exit

		check_midrange_greater:
			bge $t2, 58, convert_out_range	#if out of range, make 0
			j exit

		check_tmidrange_greater:
			bge $t2, 85, convert_out_range	#if out of range, make 0
			j exit

		check_hirange_greater:
			bge $t2, 117, convert_out_range #if out of range, make 0
			j exit

		convert_num_char:
			addi $t2, $t2, -48 		#subtract 48 to get the true value
			j add_char
			
		convert_upper_char:
			addi $t2, $t2, -55		#subtract 55 to get the true value
			j add_char
			
		convert_lower_char:
			addi $t2, $t2, -87 		#subtract 55 to get the true value
			j add_char
			
		convert_out_range:
			move $t2, $zero 		#make range 0
			j add_char

		add_char:					#adds the true value of the char to the total 
			add $s1, $s1, $t2
			j get_char

	j get_char

	exit:
		li $v0, 4				#prints line break for output
		la $a0, output
		syscall

		li $v0, 1				#prints the final total
		move $a0, $s1
		syscall
			
		li $v0, 10 				# exit program
		syscall