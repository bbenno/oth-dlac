#
 DLAC Tasks

- [x] Task 0: Proposed Modifications
- [x] Task 1: EBNF Grammar
- [x] Task 2: Lexical Analyzer (→ `lex`)
- [x] Task 3: Syntactical Analyzer
- [x] Task 4: Working Compiler

## Task 0: Proposed Modifications

> Take original definition of calculator and extend it somehow.

- operation to convert a decimal number to another base: 1210§3 = 110<sub>3</sub>, 1310§2 = 1101<sub>2</sub>
- further arithmetical operation
    + reminder(`%`)
    + power(`^`)
    + factorial(`!`)

## Task 1: EBNF Grammar

> Define language for the calculator using EBNF syntax.

```
syntax = expr;

expr = expr_bse;
expr_bse = expr_add | expr_bse, "§", expr_add;
expr_add = expr_mul | expr_add, "+", expr_mul;
expr_mul = expr_pow | expr_mul, ("*"|"%"), expr_pow;
expr_pow = expr_fac | expr_pow, ("^"), expr_fac;
expr_fac = factor | expr_fac, "!";
factor = "(", expr, ")" | number;

number = zero | nonzero, {digit};
zero = "0";
nonzero = "1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9";
digit = zero | nonzero;
```


*[DLAC]: Languages and Their Compilers
*[EBMF]: Extended Backus–Naur form
