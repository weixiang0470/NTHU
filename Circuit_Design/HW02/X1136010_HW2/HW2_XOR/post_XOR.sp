**x1136010_hw2_xor**
.protect
.lib '/home/VLSI_1131/tsx1136010/hw02/spice/post_sim/cic018.l' TT
.unprotect

.global VDD GND
Vvdd VDD 0 DC=+1.8v
Vgnd GND 0 DC=0v

.option post
+accurate=1
+ingold=2
+runlvl=6
.param SupplyV = 1.8v

.include 'XOR3_pex.cir'

**XInv IN GND VDD OUT INV
**Vin1 IN GND pulse(0v SupplyV 5n 10p 10p 5n 10n)

Xpost_xor3 A B GND VDD C S XOR3
C1 S GND 0.005p

Vin1 A GND pulse(0v 1.8v 2.5n 10p 10p 2.5n 5n )
Vin2 B GND pulse(0v 1.8v 5n   10p 10p 5n   10n)
Vin3 C GND pulse(0v 1.8v 10n  10p 10p 10n  20n)

.tran 0.01n 50n
.tem 30
.option post
.op
.measure tran power AVG POWER
.meas tran Delay1_XOR   trig v(A) val=0.9 fall=4
+			targ v(S) val=0.9 fall=3
.meas tran Delay2_XOR	trig v(A) val=0.9 rise=1
+			targ v(S) val=0.9 rise=1
.end
**x1136010_hw2_xor**
