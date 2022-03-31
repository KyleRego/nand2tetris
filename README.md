# Nand2Tetris

## Chapter 1 Notes

Every type of computer or digital device is based on a set of chips which are made of logic gates. A logic gate is a device that implements a Boolean function. A Boolean function is a function that operates on binary inputs (1 and 0) and returns binary outputs. `And`, `Or`, and `Not` are a set of three Boolean functions. This set can be used to realize any Boolean function. Even more impressive is that `And`, `Or`, and `Not` can all be expressed using only `Nand`. Therefore any Boolean function can be expressed using only `Nand`.

Any Boolean function can be expressed as a truth table. Any truth table can also be expressed as a Boolean function.

*Hardware Description Language* is a formalism used to design chip architecture. A *hardware simulator* takes the HDL program and creates a software representation of the chip logic. The simulator tests the virtual chip against a series of inputs and computes the chip outputs, which are compared to the desired outputs of the chip.

The first few chips implemented in this chapter were simple enough to reason out as Boolean functions:
```
Not(in) = out = Nand(in, in)
And(a, b) = out = Not(Nand(a, b))
Or(a, b) = out = Nand(Not(a), Not(b))
Xor(a, b) = out = Or(And(Not(a), b), And(a, Not(b)))
Mux(a, b, sel) = out = Or(And(Not(sel), a), And(sel, b))

DMux(sel, in) = a, b = And(Not(sel), in) , And(sel, in)
```