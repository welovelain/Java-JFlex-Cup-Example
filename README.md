Notation:

`NUM` – fixed point integer values with a sign, accuracy of the type signed long int (32 bits)

`STRING` – alpha-numeric string embraced with double quotation sign (”)

`IDENT` – variable identifier (string, standard naming convention)

Other key words: `and`, `or`, `not`, `if`, `then`, `else`, `while`, `do`, `print`, `readint`, `readstr`,
`begin`, `end`, `exit`, `substring`, `length`, `position`, `concatenate`.



The language grammar:


## arithmetic operators
```
num_op = "+" | "-" | "*" | "/" | "%"
```

## numerical expression, which value is a number
```
num_expr = NUM | IDENT
| "readint"
| "-" num_expr
| num_expr num_op num_expr
| "(" num_expr ")"
| "length(" str_expr ")"
| "position(" str_expr "," str_expr ")"
```


## expression, which value is a string
```
str_expr = STRING | IDENT
| "readstr"
| "concatenate(" str_expr "," str_expr ")"
| "substring(" str_expr "," num_expr "," num_expr ")"
```


## logical operators
```
bool_op = "and" | "or"
```

## logical relations
```
num_rel = "=" | "<" | "<=" | ">" | ">=" | "<>"
str_rel = "==" | "!="

bool_expr = "true" | "false"
| "(" bool_expr ")"
| "not" bool_expr
| bool_expr bool_op bool_expr
| num_expr num_rel num_expr
| str_expr str_rel str_expr
```

## basic constucts
```
simple_instr = assign_stat
| if_stat
| while_stat
| "begin" instr "end"
| output_stat
| "exit"
```


## instuction sequence
```
instr = instr ";" simple_instr | simple_instr
```

## assignment
```
assign_stat = IDENT ":=" num_expr
| IDENT ":=" str_expr
```


## conditional statement
```
if_stat = "if" bool_expr "then" simple_instr
| "if" bool_expr "then" simple_instr "else" simple_instr
```

## "while" loop
```
while_stat = "while" bool_expr "do" simple_instr
| "do" simple_instr "while" bool_expr
```

## printing to the screen
```
output_stat = "print(" num_expr ")"
| "print(" str_expr ")"
```

## progam itself
```
program = instr
```



Additional explanations:


- There are two data types – integer values with the sign (with a range corresponding to
signed int), and strings (corresponding to char*). The variables are not declarable,
the first usage determines the type (uninitialized numerical value equals to 0, uninitialized
string contains an empty string). Checking the datatype should be done at usage.

- The function length(string) – returns an integer equal to the length of string being the
parameter. The length of an empty string is 0.

- The function concatenate(string1,string2) – returns a string being the
concatenation of strings given as parameters.

- The function substring(string1,pos,length) – returns a substring of the string
given as the first parameter, starting at position pos (positive integer) and of length at most
length (positive integer). Positions are counted from 1. For incorrect value of the pos
parameter (less then 1 or greater than the string length) or a non-positive value of the
length parameter, the function returns an empty string. If the value of length to big
(pos+length-1>length(string)), a sufix of the parameter is returned.

- The function position(string1,string2) – returns an integer denoting the first
occurrence of the substring string2 in the string string1, if only string2 is included
in string1. Otherwise, 0 is returned.

- The function print(expr) prints a result of an expression being the parameter t the
standard output (the screen).

- The function readint is used to input an integer from the keyboard. Its result is the read
value (it can be assigned to a variable or used directly in the code).

- The function readstr is used to input a sting from the keyboard. Its result is the read
value (it can be assigned to a variable or used directly in the code).


------

How to run: 

```
chmod +x boot.sh
./boot.sh
```

`boot.sh` contains all necessary steps to run the program.

```
lcalc.flex - lexical parser
ycalc.cup - grammer parser
test.txt - example code of the program
Main.java - contains all necessary Java classes for CUP parsing and all operations.
boot.sh - boot file
jflex-1.6.1 - directory with JFlex
java-cup-11b.jar - CUP 
java-cup-11b-runtime.jar - Also CUP
```
