** X1136010_HW1 **
** Environment setting **
*************************
.protect
.lib "/usr/cad/cic018.l" tt
.unprotect

Cdecap vdd vss 0.1u 

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
Xinv NOR OR vdd vss INV
.ends

*** NAND ***
.subckt NAND2 in1 in2 NAND vdd vss
** 2 pFET in parallel **
mp1 NAND in1 vdd vdd P_18 w=0.5u l=0.18u
mp2 NAND in2 vdd vdd P_18 w=0.5u l=0.18u
** 2 nFET in series **
mn1 NAND in1 ns1 vss N_18 w=0.25u l=0.18u
mn2 ns1 in2 vss vss N_18 w=0.25u l=0.18u
.ends

*** AND ***
.subckt AND2 in1 in2 AND vdd vss
Xnand in1 in2 NAND vdd vss NAND2
Xinv NAND AND vdd vss INV
.ends

*** logic function ***
.subckt logic A B C D F_out vdd vss
Xinv B B_ vdd vss INV
Xor A B_ f1 vdd vss OR2
Xand C f1 F_out vdd vss AND2
.ends
