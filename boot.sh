#!/bin/bash

#compile
jflex-1.6.1/bin/jflex lcalc.flex;
java -cp .:java-cup-11b.jar java_cup.Main  < ycalc.cup;
javac -cp .:java-cup-11b.jar Main.java;

#run
java -cp .:java-cup-11b-runtime.jar Main test.txt;

#clean
rm Lexer.java;
rm parser.java;
rm sym.java;
rm *.class;

