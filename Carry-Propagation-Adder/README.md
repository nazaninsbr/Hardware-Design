# Carry-Propagation-Adder
the Verilog code of a 4 bit Carry Propagation Adder. 
The addition will start at the least significant bit and if there is a carry it will past on to the adder adding the next two bits. 

An explanation of how it works is available here: http://www.ece.ubc.ca/~stevew/515/handouts/arith.pdf 

**What Each File Does**

_testCPA_: This file is a test for the adder we have created we provide two, 4 bit numbers in this file and give them to the CPA module and see the result of the addition. 

_CPA_: This file is out Carry Propagation Adder made up of 4 full adders. 

_FA_: This is a full adder. The addition of 2, one bit numbers and a carry in takes place inside this file. 
