students_code: start.o students_code.o aux_code.o
	ld  $^ -o $@

%.o: %.asm
	as $^ -o $@
