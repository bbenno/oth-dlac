CC=gcc
FNAME=calc
YEXT=.tab
LIB=functions.c

$(FNAME): $(FNAME).yy.c $(FNAME)$(YEXT).c $(LIB)
	$(CC) $^ -o $@
	chmod +x $@

$(FNAME).yy.c: $(FNAME).l $(FNAME)$(YEXT).h
	lex -o $@ $<

$(FNAME)$(YEXT).h $(FNAME)$(YEXT).c: $(FNAME).y
	yacc -d -o $(FNAME)$(YEXT).c $<

test_pos: test_pos.txt calc
	./$(FNAME) $<
test_neg: test_neg.txt calc
	xargs -n1 ./$(FNAME) < $<

test: test_pos test_neg

clean: 
	rm -rf *.o *.out
	rm -f $(FNAME).yy.c
	rm -rf $(FNAME)$(YEXT).*
	rm -f $(FNAME)

.PHONY: clean test_pos test_neg test
