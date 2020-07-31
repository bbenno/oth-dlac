# Languages and Their Compilers (DLAC) -- Summer 2020

## Setup

In order to setup the compiler pleas follow the following steps:
```sh
# 1. enter source directory of repository
cd oth-dlac/src

# 2. build compiler
make

# (optional) run test files
make test
```

## Tasks

- [x] Task 0: Proposed Modifications
- [x] Task 1: EBNF Grammar
- [x] Task 2: Lexical Analyzer (→ `lex`)
- [x] Task 3: Syntactical Analyzer (→ `bison`|`yacc`)
- [x] Task 4: Working Compiler

### Task 0: Proposed Modifications

> Take original definition of calculator and extend it somehow.

- operation to convert a decimal number to another base: 1210§3 = 110<sub>3</sub>, 1310§2 = 1101<sub>2</sub>
- further arithmetical operation
    + reminder(`%`)
    + power(`^`)
    + factorial(`!`)

### Task 1: EBNF Grammar

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

### Task 2: Lexical Analyzer
> Make a lexical analyzer for your language using your grammar.

### Task 3: Syntactical Analyzer
> Make a syntactical analyzer for your language based on your grammar and lex analysis.
> The analyzer should check your grammar.

### Task 4: Working Compiler
> Make the compiler working, compiling to target language and calculating the numbers.

## Recommended Literature

- Mogensen, T. A.: Introduction to Compiler Design, e-ISBN: 978-0-85729-829-4
- Watson, D: A Practical Approach to Compiler Construction, ISBN:  978-3-319-52789-5
- Grune, D. et all: Modern Compiler Design, ISBN: 978-1-4614-4699- 6

*[DLAC]: Languages and Their Compilers
*[EBMF]: Extended Backus–Naur form
