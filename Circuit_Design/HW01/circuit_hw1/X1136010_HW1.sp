** X1136010_HW1 **
** Environment setting **
*************************
.protect
.lib "/usr/cad/cic018.l" tt
.unprotect

.global vdd vss
Vdd vdd 0 DC=+1.8v
Vgnd vss 0 DC=0v

Cdecap vdd vss 0.1u 
*      Your code        *
*************************

** mname [drain] [gate] [source] [body] [P_18/N_18] [w=width] [l=length] **

*** Inverter ***
.subckt INV in1 out vdd vss
**pFET drain=output, gate=input, source and body = vdd **
mp1 out in1 vdd vdd P_18 w=0.5u l=0.18u
**nFET drain=output, gate=input, source and body = vss(gnd) **
mn1 out in1 vss vss N_18 w=0.25u l=0.18u
.ends

*** NOR ***
.subckt NOR2 in1 in2 NOR vdd vss
** 2 pFET in series **
mp1 pd1 in1 vdd vdd P_18 w=0.5u l=0.18u
mp2 NOR in2 pd1 vdd P_18 w=0.5u l=0.18u
** 2 nFET in parallel **
mn1 NOR in1 vss vss N_18 w=0.25u l=0.18u
mn2 NOR in2 vss vss N_18 w=0.25u l=0.18u
.ends

*** OR ***
.subckt OR2 in1 in2 OR vdd vss
Xnor in1 in2 NOR vdd vss NOR2
** NOR&INV = OR **
Xinv NOR OR  vdd vss INV
.ends

*** NAND ***
.subckt NAND2 in1 in2 NAND vdd vss
** 2 pFET in parallel **
mp1 NAND in1 vdd vdd P_18 w=0.5u l=0.18u
mp2 NAND in2 vdd vdd P_18 w=0.5u l=0.18u
** 2 nFET in series **
mn1 NAND in1 ns1 vss N_18 w=0.25u l=0.18u
mn2 ns1  in2 vss vss N_18 w=0.25u l=0.18u
.ends

*** AND ***
.subckt AND2 in1 in2 AND vdd vss
Xnand in1  in2 NAND vdd vss NAND2
Xinv  NAND AND vdd  vss INV
.ends

*** logic function ***
.subckt logic A B C D F_out vdd vss
Xinv B B_ vdd   vss INV
Xor  A B_ f1    vdd vss OR2
Xand C f1 F_out vdd vss AND2
.ends


Xlogic A B C D F vdd vss logic
** Xinv A F vdd vss INV
**** Voltage source setting ****
*** Vname node1 node2 pulse (v1  v2   td      tr        tf        pw          per    )***
*** Vname node1 node2 pulse (low high delay_t raising_t falling_t pulse_width period )***
Vin1 A vss pulse(0v 1.8v 127n 1n 1n 127n 256n)
Vin2 B vss pulse(0v 1.8v 63n  1n 1n 63n  128n)
Vin3 C vss pulse(0v 1.8v 31n  1n 1n 31n  64n)
Vin4 D vss pulse(0v 1.8v 15n  1n 1n 15n  32n)

** Inverter Test **
Xinv In1 Out1 vdd vss INV
Vin5 In1 vss pulse(0v 1.8v 31n 1n 1n 31n 64n)

** AND2 Test **
Xand in_and1 in_and2 and_out vdd vss AND2
Vin6 in_and1 vss pulse(0v 1.8v 127n 1n 1n 127n 256n)
Vin7 in_and2 vss pulse(0v 1.8v 63n  1n 1n 63n  128n)

** OR2 Test **
Xor in_or1 in_or2 or_out vdd vss OR2
Vin8 in_or1 vss pulse(0v 1.8v 127n 1n 1n 127n 256n)
Vin9 in_or2 vss pulse(0v 1.8v 63n  1n 1n 63n  128n)

.tran 0.01n 260n
.unprotect
.tem 30
.option post
.op
.end
