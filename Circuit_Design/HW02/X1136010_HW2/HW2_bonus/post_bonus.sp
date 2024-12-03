**X1136010_HW2_Bonus**
**Environment setting**
.protect
.lib '/home/VLSI_1131/tsx1136010/hw02/spice/post_sim/cic018.l' TT
.unprotect

**Define voltage sources**
.global VDD GND
Vdd VDD 0 DC=+1.8v
Vgnd GND 0 DC=0v
**End voltage sources**

.option post
+accurate=1
+ingold=2
+runlvl=6
.param SupplyV = 1.8v

.include 'hw2_bonus.pex.netlist'

*Main circuit**
**A=5ns (1/200M) , B=10ns (1/100M) , C=20ns (1/50M)**
Xhw2_XOR B C VDD GND A S BONUS
C1 S GND 0.005p
**Input signal**
**Vname node1 node2 pulse (low high delay_time r_t f_t pul_width period)
Vin1 A GND pulse(0v 1.8v 2.5n 10p 10p 2.5n 5n )
Vin2 B GND pulse(0v 1.8v 5n   10p 10p 5n   10n)
Vin3 C GND pulse(0v 1.8v 10n  10p 10p 10n  20n)

**Simulation Setting**
.tran 0.01n 50n
.tem 30
.option post
.op
.measure tran power AVG POWER
.meas	tran	Delay1_XOR	trig	v(A)	val=0.9 fall=4
+				targ	v(S)	val=0.9 fall=3
.meas	tran	Delay2_XOR	trig	v(A)	val=0.9 rise=1
+				targ	v(S)	val=0.9 rise=1
.end
