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

## Chapter 2 Notes

Word size is a common hardware term for the number of bits used by a computer to represent a basic chunk of information (for example an integer). Using *n* bits, we can represent the integers from 0 to 2^n - 1.

When adding binary numbers, *overflow* occurs when the most significant bit addition generates a carry of 1. In this course we just ignore overflow.

The *two's complement method* is a coding scheme commonly used to represent signed numbers in binary code. The two's complement binary code that represents negative x is taken to be the code that represents 2^n - x. This allows for n bits to code 2^n binary numbers ranging from -2^(n-1) to 2^(n-1) - 1. The code of any nonnegative number begins with a 0. The code of any negative number begins with a 1. A nice feature of the two's complement method is that subtraction is handled as a special case of addition. For example, 5 + (-7) is 0101 + 1001 = 1110 which is the binary code for -2.

## Chapter 3 Notes

In the first 2 chapters we built chips which were time independent; these are sometimes called *combinational*. In this chapter we build *sequential* or *clocked* chips, which have outputs which depend not only on the inputs in the current time but also on previous inputs and outputs. 

In addition to the Nand gate, a second built-in chip is taken to be the *data flip-flip* (DFF).

Time is taken to be a discrete thing broken into cycles. The cycle length must be chosen such that it is long enough to contain the longest possible time delay in the system. The cycles are realized by an oscillator that alternates continuously between 0 and 1; this master clock signal is simultaneously broadcast to every memory chip in the system where it is funneled into the DFF gates.

The DFF interface includes a single-bit input, a single-bit output, and a clock input from the master clock signal; this allows the DFF to implement the behavior out(t) = in(t-1). At the end of each clock cycle, the DFFs output their inputs from the previous cycle.