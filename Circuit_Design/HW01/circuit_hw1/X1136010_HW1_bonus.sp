** X1136010_HW1_bonus **
** Environment setting **
*************************
.protect
.include './mylib.sp'
.unprotect

.global vdd vss
Vvdd vdd 0 DC=+1.8v
Vgnd vss 0 DC=0v
*************************

** mname [drain] [gate] [source] [body] [P/N] [w=width] [l=length] **

*** bi-direction switcch ***
*** y=x*s,iff s==1 ***
.subckt MUX1 S in Y vdd vss
Xinv S S_ vdd vss INV
mp1  Y S_ in  vdd P_18 w=0.5u l=0.18u
mn1  Y S  in  vss N_18 w=0.25u l=0.18u
.ends

.subckt MUX2 S D0 D1 Y vdd vss
Xinv  S  S_   vdd vss INV
Xmux1 S_ D0 Y vdd vss MUX1
Xmux2 S  D1 Y vdd vss MUX1
.ends

*** 4 to 1 MUX ***
.subckt MUX S0 S1 D0 D1 D2 D3 Y vdd vss
**Xinv S0 S0_ vdd vss INV
**Xinv S1 S1_ vdd vss INV
Xmymux1 S0 D0  D1  D01 vdd vss MUX2
Xmymux2 S0 D2  D3  D23 vdd vss MUX2
Xmymux3 S1 D01 D23 Y   vdd vss MUX2
.ends


Xmux4t1 S0 S1 D0 D1 D2 D3 Y vdd vss MUX
Vin1 S1 vss pulse(0v 1.8v 255n 1n 1n 255n 512n)
Vin2 S0 vss pulse(0v 1.8v 127n 1n 1n 127n 256n)
Vin3 D3 vss pulse(0v 1.8v 63n  1n 1n 63n  128n)
Vin4 D2 vss pulse(0v 1.8v 31n  1n 1n 31n  64n)
Vin5 D1 vss pulse(0v 1.8v 15n  1n 1n 15n  32n)
Vin6 D0 vss pulse(0v 1.8v 7n   1n 1n 7n   16n)

.tran 0.01n 520n
.unprotect
.tem 30
.option post
.op
.end
