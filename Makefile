students_code_deb: start.o students_code_deb.o aux_code.o
	ld  $^ -o $@

%.o: %.asm
	as $^ -o $@
