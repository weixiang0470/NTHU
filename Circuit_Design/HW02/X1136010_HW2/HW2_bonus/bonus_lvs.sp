**X1136010_HW2_Bonus**
**Environment setting**
**.protect
**.lib "cic018.l" tt
**.unprotect

**Define voltage sources**
.global VDD GND
Vdd VDD 0 DC=+1.8v
Vgnd GND 0 DC=0v
**End voltage sources**

**Design**
**mname [drain] [gate] [source] [body] [P_18/N_18] [w] [l]**
**nFET w=0.5u, pFET w=1.2u (0.5*2.33)
**Inverter**
.subckt INV in out VDD GND
mp1 out in VDD VDD P_18 w=1.2u l=0.18u
mn1 out in GND GND N_18 w=0.53u l=0.18u
.ends
**End inverter**

**XOR3 bonus**
.subckt Bonus A B C S VDD GND
**Getting A_bar, B_bar, C_bar**
Xinv1 A A_ VDD GND INV
Xinv2 B B_ VDD GND INV
Xinv3 C C_ VDD GND INV

**nFET part**
mn1	C	B_	B1o N_18 w=0.53u l=0.18u
mn2	C_	B	B1o N_18 w=0.53u l=0.18u
mn3	B1o	A_	S   N_18 w=0.53u l=0.18u
mn4	C	B	B2o N_18 w=0.53u l=0.18u
mn5	C_	B_	B2o N_18 w=0.53u l=0.18u
mn6	B2o	A	S   N_18 w=0.53u l=0.18u
.ends
**End XOR3 bonus**

**Main circuit**
**XInv in out VDD GND INV
**Vin4 in GND pulse(0v 1.8v 2.5n 10p 10p 2.5n 5n)

**A=5ns (1/200M) , B=10ns (1/100M) , C=20ns (1/50M)**
**Xhw2_XOR A B C S VDD GND XOR3
**C1 S GND 0.005p
**Input signal**
**Vname node1 node2 pulse (low high delay_time r_t f_t pul_width period)
**Vin1 A GND pulse(0v 1.8v 2.5n 10p 10p 2.5n 5n )
**Vin2 B GND pulse(0v 1.8v 5n   10p 10p 5n   10n)
**Vin3 C GND pulse(0v 1.8v 10n  10p 10p 10n  20n)

**Simulation Setting**
**.tran 0.01n 50n
**.tem 30
**.option post
**.op
**.measure tran power AVG POWER
**.meas	tran	Delay1_XOR	trig	v(A)	val=0.9 fall=4
**+				targ	v(S)	val=0.9 fall=3
**.meas	tran	Delay2_XOR	trig	v(A)	val=0.9 rise=1
**+				targ	v(S)	val=0.9 rise=1
**.end
