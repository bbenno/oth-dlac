FNAME=calc
YEXT=.tab

calc: $(FNAME).l
	yacc --defines=$(FNAME)$(YEXT).h -o $(FNAME)$(YEXT).c $(FNAME).y
	lex -o $(FNAME).yy.c $(FNAME).l
	gcc $(FNAME).yy.c $(FNAME)$(YEXT).c -o $(FNAME)

test-yacc: calc test-y.txt
	./$(FNAME) < test-y.txt

test-lex: calc test-l.txt
	./$(FNAME) test-l.txt || echo "\n\ntest failed\n\n"

clear: 
	rm -rf *.o
	rm -f $(FNAME).yy.c
	rm -rf $(FNAME)$(YEXT).*
	rm -f $(FNAME)

.PHONY: clear calc test-yacc test-lex
