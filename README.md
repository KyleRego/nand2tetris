# Nand2Tetris

## Chapter 1 Notes

Every type of computer is based on a set of chips which are made of logic gates. A logic gate is a device that implements a Boolean function. A Boolean function is a function that operates on binary inputs and returns binary outputs. `And`, `Or`, and `Not` are three Boolean functions or Boolean operators. There is nothing special about this set of Boolean functions, however this set can be used to express any Boolean function. Even more impressive is that `And`, `Or`, and `Not` can all be constructed using only `Nand`. Therefore any Boolean function can be expressed using only `Nand`.

Any Boolean function can be expressed as a truth table. It is less obvious but also true that any truth table can be expressed as a Boolean function.

*Hardware Description Language* is a formalism used to design chip architecture. A *hardware simulator* takes the HDL program and creates a software representation of the chip logic. The simulator tests the virtual chip against a series of inputs, computes the chip outputs, which are compared to the desired outputs of the chip.

```
Not(in) = out = Nand(in, in)
And(a, b) = out = Not(Nand(a, b))
Or(a, b) = out = Nand(Not(a), Not(b))
Xor(a, b) = out = Or(And(Not(a), b), And(a, Not(b)))
Mux(a, b, sel) = out = Or(And(Not(sel), a), And(sel, b))

DMux(sel, in) = a, b = And(Not(sel), in) , And(sel, in)
```