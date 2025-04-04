# Wolfram

## Description

The Wolfram project involves implementing an [elementary cellular automaton](https://en.wikipedia.org/wiki/Elementary_cellular_automaton) in the terminal using Haskell. It aims to reproduce the evolution rules of a Wolfram automaton on an infinite space by simulating the evolution of cells generation after generation.


## Compilation

The project uses Stack for compilation and is managed via a Makefile containing the following rules:

```make``` : Compiles the project via stack build

```make clean``` :  Removes compiled files

```make fclean``` :  Removes all compilation and build files

```make re ```: Completely recompiles the project

## Features

The program implements the following rules: 

- *Rule 30*

- *Rule 90*

- *Rule 110*

## Usage

The program supports several command line options:

```./wolfram --rule <num> [--start <num>] [--lines <num>] [--window <num>] [--move <num>]```


```--rule <num>``` :  Specifies the rule to use (0->256)

```--start <num>``` : Generation number from which the display begins (default 0)

```--lines <num>``` : Number of lines to display (if omitted, the program continues indefinitely)

```--window <num>``` : Number of cells displayed on each line (default 80)

```--move <num>``` : Translation applied to the display window (positive: right, negative: left)

## Bonus

As a bonus, all 256 possible rules have been implemented, allowing for complete simulation of Wolfram cellular automaton.
