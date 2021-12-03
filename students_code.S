.global	keyMixing, byteSubstitution, shiftRows, cipher

.section	.data
sbox:	.byte	99,124,119,123,-14,107,111,-59,48,1,103,43,-2,-41,-85,118
		.byte	-54,-126,-55,125,-6,89,71,-16,-83,-44,-94,-81,-100,-92,114,-64
		.byte	-73,-3,-109,38,54,63,-9,-52,52,-91,-27,-15,113,-40,49,21
		.byte	4,-57,35,-61,24,-106,5,-102,7,18,-128,-30,-21,39,-78,117
		.byte	9,-125,44,26,27,110,90,-96,82,59,-42,-77,41,-29,47,-124
		.byte	83,-47,0,-19,32,-4,-79,91,106,-53,-66,57,74,76,88,-49
		.byte	-48,-17,-86,-5,67,77,51,-123,69,-7,2,127,80,60,-97,-88
		.byte	81,-93,64,-113,-110,-99,56,-11,-68,-74,-38,33,16,-1,-13,-46
		.byte	-51,12,19,-20,95,-105,68,23,-60,-89,126,61,100,93,25,115
		.byte	96,-127,79,-36,34,42,-112,-120,70,-18,-72,20,-34,94,11,-37
		.byte	-32,50,58,10,73,6,36,92,-62,-45,-84,98,-111,-107,-28,121
		.byte	-25,-56,55,109,-115,-43,78,-87,108,86,-12,-22,101,122,-82,8
		.byte	-70,120,37,46,28,-90,-76,-58,-24,-35,116,31,75,-67,-117,-118
		.byte	112,62,-75,102,72,3,-10,14,97,53,87,-71,-122,-63,29,-98
		.byte	-31,-8,-104,17,105,-39,-114,-108,-101,30,-121,-23,-50,85,40,-33
		.byte	-116,-95,-119,13,-65,-26,66,104,65,-103,45,15,-80,84,-69,22

.section	.text
keyMixing:
    # get the parameters
    movq %rdi, %rax
    movq %rsi, %rcx

    # rdx is a counter
    # r8 is the index
    # r9 is the value in input
    # r10 is the value in key
    movq $16, %rdx
    movq $0, %r8
    movq $0, %r9
    movq $0, %r10

    loop:
    movsxb (%rax ,%r8, 1), %r9
    movsxb (%rcx ,%r8, 1), %r10
    xor %r10, %r9
    movb %r9b, (%rax ,%r8, 1)

    # movsxb (%rax ,%r8, 1), %r11

    inc %r8
    cmp %r8, %rdx
    jne loop
    ret


byteSubstitution:
	ret


shiftRows:
    movq %rdi, %rax
    movq $0, %r8
    movq $0, %r9
    movq $0, %r10
    movq $0, %r11

    movb 4(%rax), %r8b
    movb 5(%rax), %r9b
    movb 6(%rax), %r10b
    movb 7(%rax), %r11b

    movb  %r9b, 4(%rax)
    movb  %r10b,5(%rax)
    movb  %r11b,6(%rax)
    movb  %r8b, 7(%rax)

    movb 8(%rax), %r8b
    movb 9(%rax), %r9b
    movb 10(%rax), %r10b
    movb 11(%rax), %r11b

    movb  %r10b, 8(%rax)
    movb  %r11b, 9(%rax)
    movb  %r8b, 10(%rax)
    movb  %r9b, 11(%rax)

    movb 12(%rax), %r8b
    movb 13(%rax), %r9b
    movb 14(%rax), %r10b
    movb 15(%rax), %r11b

    movb  %r11b, 12(%rax)
    movb  %r8b, 13(%rax)
    movb  %r9b, 14(%rax)
    movb  %r10b, 15(%rax)
	ret


cipher:
	ret
