FNAME=calc

calc: $(FNAME).l
	lex -o $(FNAME).yy.c $(FNAME).l
	gcc $(FNAME).yy.c -o $(FNAME) -ll

test: calc test.txt
	./$(FNAME) test.txt || echo "\n\ntest failed\n\n"

clear: 
	rm -rf *.o
	rm -rf $(FNAME).yy.c

.PHONY: clear calc test
