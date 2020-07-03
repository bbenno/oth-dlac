FNAME=calc

$(FNAME): $(FNAME).yy.c
	gcc $^ -o $@
	chmod +x $@

$(FNAME).yy.c: $(FNAME).l
	lex -o $@ $<

test: test.txt calc
	./$(FNAME) $<

clear: 
	rm -rf *.o
	rm -f $(FNAME).yy.c
	rm -rf $(FNAME)$(YEXT).*
	rm -f $(FNAME)

.PHONY: clear test
