# Zhenia Steger
# Encryption in Assembly Language
# Cal State San Marcos

.data
str: .asciiz "Welcomes!\n"
str2: .asciiz "Enter 9 characters:\n"
spc: .asciiz " "
newline: .asciiz "\n"
string1: .asciiz "\nThe Encrypted output is: "
string2: .asciiz "\nThe Decrypted output is: "
string3: .asciiz "\nYou Entered: "
space: .asciiz " "
input: .byte '-','-','-','-','-','-','-','-','-','-'
space1: .asciiz " "
encrypt: .byte '-','-','-','-','-','-','-','-','-','-'
space2: .asciiz " "
decrypt: .byte '-','-','-','-','-','-','-','-','-','-'
space3: .asciiz " "
.text

# Start of main code
main:
li $v0, 4		# Welcome
la $a0, str
syscall
la $a0, str2		# Enter characters
syscall

# Declare arrays for encrypt and decrypt
li $t0, 10
la $s1, input
la $s2, encrypt
la $s3, decrypt

# Entering characters
li $v0, 8
la $a0, input
li $a1, 10
syscall
# Print for fun
li $v0, 4
la $a0, string3
syscall
la $a0, input
syscall

# Encryption loop
encryptLoop: beq $0, $t0, printEncrypted
lb $t1, 0($s1)
xor $t1, 5
sb $t1, 0($s2)
li $t1, 0
addi $s1, $s1, 1
addi $s2, $s2, 1
sub $t0, $t0, 1
j encryptLoop

# RSetting all pointers back to normal
printEncrypted:
li $t0, 10
li $t1, 0
la $s1, input
la $s2, encrypt
la $s3, decrypt

# Printing Encrypted output
li $v0, 4
la $a0, newline
syscall
la $a0, string1
syscall
la $a0, encrypt
syscall

# Decryption loop
decryptLoop: beq $0, $t0, output
lb $t1, 0($s2)
xor $t1, 5
sb $t1, 0($s3)
li $t1, 0
addi $s2, $s2, 1
addi $s3, $s3, 1
sub $t0, $t0, 1
j decryptLoop

# Outputting the decrypted
output:
li $v0, 4
la $a0, string2
syscall
la $a0, decrypt
syscall
# Exit Properly
li $v0, 10
syscall
