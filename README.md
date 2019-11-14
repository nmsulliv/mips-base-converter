# corg-prj-1

Assume your Howard ID as a decimal integer is X. Let N = 26 + (X % 11) where % is the modulo operation, and M = N – 10.

You will write a MIPS program that reads a string of exactly 10 characters (including spaces, excluding the null character at the end) from user input.

   • For each of the characters in the input,
      • If it is from '0' to '9'and from 'a' to β and from 'A' to Δ,treat it as a single digit base-N number.
        β stands for the M-th lower case  letter and Δ stands for the M-th upper case letter in the English alphabet. 
        In a base-N number, both 'a' and 'A' correspond to the decimal integer of 10, both 'b' and 'B' to 11, and so on. Both         β and Δ correspond to N – 1. 
      • If it is not in the above specified range, ignore it.
      
  • Sum up all the single-digit base-N numbers from the input, please the result as an unsigned decimal number. If there is no     base-N numbers in the input, print 0. NO OTHER CHARACTERS SHOULD BE PRINTED, or it will be marked as wrong.
    The program MUST EXIT after processing one single user input.

Sample test cases (assuming the Howard ID is 12345678):
12345678 % 11 = 4, therefore the base is 26 + 4 = 30, β is 't' and Δ is 'T'.
  • Input: 0000000000 Output: 0
  • Input: 0000000001 Output: 1
  • Input: 1000000000 Output: 1
  • Input: 1111111111 Output: 10
  • Input: 9999999999 Output: 90
  • Input: aaaaaAAAAA Output: 100
  • Input: TTTTTttttt Output: 290
  • Input: 12345ABCst Output: 105
  • Input: uvwXYZ!@#$ Output: 0
  • Input: u1wXYZ!b#$ Output: 12
  • Input: u1w b%     Output: 12
    (There are two spaces at the beginning, in the middle and at the end respectively of the above input.)
