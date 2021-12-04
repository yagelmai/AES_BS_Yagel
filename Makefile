students_code: start.o students_code.o
	ld  $^ -o $@

%.o: %.asm
	as $^ -o $@
