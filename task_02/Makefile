FNAME=calc
YEXT=.tab

$(FNAME): $(FNAME).yy.c $(FNAME)$(YEXT).c
	gcc $^ -o $@
	chmod +x $@

$(FNAME).yy.c: $(FNAME).l $(FNAME)$(YEXT).h
	lex -o $@ $<

$(FNAME)$(YEXT).h $(FNAME)$(YEXT).c: $(FNAME).y
	yacc -d -o $(FNAME)$(YEXT).c $<

test-yacc: test-y.txt calc
	./$(FNAME) < $<

test-lex: test-l.txt calc
	./$(FNAME) $<

clear: 
	rm -rf *.o
	rm -f $(FNAME).yy.c
	rm -rf $(FNAME)$(YEXT).*
	rm -f $(FNAME)

.PHONY: clear test-yacc test-lex
