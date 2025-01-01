** DCIM **
** Environment setting **
.tran 0.01n 26n
.option POST
.protect
.lib "/usr/cad/cic018.l" tt
.temp 30
.unprotect
*.protect
*.lib "cic018.l" tt
*.unprotect
*********************
** Clock Parameter **
*********************
.param    CLK_Period = 2n
.param    CLK_Period_2 = 'CLK_Period/2'
.param    r_time = 1p
.param    f_time = 1p
.param    SupplyV = 1.8v
********************
* voltage setting **
********************
.global VDD GND
Vdd1 VDD 0 DC=+1.8v
Vgnd1 GND 0 DC=0v

*****************
*** My subckt ***
*****************

.subckt pFET D G S VDD
mp1 D G S VDD P_18 w=0.72u l=0.18u
.ends

.subckt nFET D G S GND
mn1 D G S GND N_18 w=0.36u l=0.18u
.ends

.subckt INV in out VDD GND
mp1	out in VDD VDD P_18 w=0.72u l=0.18u
mn1	out in GND GND N_18 w=0.36u l=0.18u
.ends

.subckt TG in C C_ out VDD GND
*Xinv1	c   c_ VDD GND INV
mp1 	out C_ in VDD P_18 w=0.72u l=0.18u
mn1	out C  in GND N_18 w=0.36u l=0.18u
.ends

.subckt DLatch_TG D C Q VDD GND
Xtg1 	D C C_ d1 VDD GND TG
Xinv1 	d1 d2 VDD GND INV
Xinv2	d2 Q  VDD GND INV
Xinv3 	C  C_ VDD GND INV
Xtg2	Q C_ C d1 VDD GND TG
.ends

.subckt W w3 w2 w1 w0 VDD GND
Xl1	GND GND w0 VDD GND DLatch_TG
Xl2	GND GND w1 VDD GND DLatch_TG
Xl3	GND GND w2 VDD GND DLatch_TG
Xl4	GND GND w3 VDD GND DLatch_TG
.ends

.subckt DLatch_tr D C Q VDD GND
Xinv1	C	C_	VDD GND INV
Xnf1	d1	C	D GND nFET
Xinv2	d1	Q_	VDD GND INV
Xinv3	Q_	Q	VDD GND INV
Xnf2	d1	C_	Q GND nFET
.ends

.subckt NOR2 in1 in2 NOR VDD GND
mp1	pd1 in1 VDD VDD P_18 w=0.72u l=0.18u
mp2	NOR in2 pd1 VDD P_18 w=0.72u l=0.18u
mn1	NOR in1 GND GND N_18 w=0.36u l=0.18u
mn2	NOR in2 GND GND N_18 w=0.36u l=0.18u
.ends

.subckt	OR2 in1 in2 OR VDD GND
Xnor	in1 in2 NOR VDD GND NOR2
Xinv	NOR OR VDD GND INV
.ends

.subckt NAND2 in1 in2 NAND VDD GND
mp1	NAND in1 VDD VDD P_18 w=0.72u l=0.18u
mp2	NAND in2 VDD VDD P_18 w=0.72u l=0.18u
mn1	NAND in1 ns1 GND N_18 w=0.36u l=0.18u
mn2	ns1  in2 GND GND N_18 w=0.36u l=0.18u
.ends

.subckt AND2 in1 in2 AND VDD GND
Xnand	in1 in2 NAND VDD GND NAND2
Xinv	NAND	AND VDD GND INV
.ends

*** XNOR ***
.subckt XNOR2 A B XNOR VDD GND
Xinv1	A A_ VDD GND INV
Xinv2	B B_ VDD GND INV
Xnand1	A  B ndAB VDD GND NAND2
Xor1	A  B AorB VDD GND OR2
Xnand2	ndAB AorB XNOR VDD GND NAND2
.ends
*** XOR ***
.subckt XOR2 A B XOR VDD GND
Xxnor	A B XNOR VDD GND XNOR2
Xinv1	XNOR XOR VDD GND INV
.ends
*** Half Adder ***
.subckt HalfAdd1 A B Cout Sum VDD GND
Xxor	A B Sum  VDD GND XOR2
Xand	A B Cout VDD GND AND2
.ends
*** Full Adder ***
.subckt FullAdd1 A B C Cout S VDD GND
mp1  x1  A VDD VDD P_18 w=0.72u l=0.18u
mp2  x1  B VDD VDD P_18 w=0.72u l=0.18u
mp3  x3  A VDD VDD P_18 w=0.72u l=0.18u
mp4  cob B x3  VDD P_18 w=0.72u l=0.18u
mp5  cob C x1  VDD P_18 w=0.72u l=0.18u

mn1  cob C x2  GND N_18 w=0.36u l=0.18u
mn2  x2  A GND GND N_18 w=0.36u l=0.18u
mn3  x2  B GND GND N_18 w=0.36u l=0.18u
mn4  cob B x4  GND N_18 w=0.36u l=0.18u 
mn5  x4  A GND GND N_18 w=0.36u l=0.18u 

mp6 x5  A VDD VDD P_18 w=0.72u l=0.18u 
mp7 x5  B VDD VDD P_18 w=0.72u l=0.18u 
mp8 x5  C VDD VDD P_18 w=0.72u l=0.18u 
mp9 sb  cob x5 VDD P_18 w=0.72u l=0.18u 

mn6 sb cob x6 GND N_18 w=0.36u l=0.18u 
mn7 x6 A GND GND N_18 w=0.36u l=0.18u 
mn8 x6 B GND GND N_18 w=0.36u l=0.18u 
mn9 x6 C GND GND N_18 w=0.36u l=0.18u

mp10 Cout cob VDD VDD P_18 w=0.72u l=0.18u
mn10 Cout cob GND GND N_18 w=0.36u l=0.18u

mp11 x7 A VDD VDD P_18 w=0.72u l=0.18u 
mp12 x8 B x7  VDD P_18 w=0.72u l=0.18u 
mp13 sb C x8  VDD P_18 w=0.72u l=0.18u

mn11 sb C  x9  GND N_18 w=0.36u l=0.18u 
mn12 x9 B  x10 GND N_18 w=0.36u l=0.18u 
mn13 x10 A GND GND N_18 w=0.36u l=0.18u 

mp14 S sb VDD VDD P_18 w=0.72u l=0.18u 
mn14 S sb GND GND N_18 w=0.36u l=0.18u 
.ends

*** Full Adder 4 bits ***
.subckt FullAdd4 A3 A2 A1 A0 B3 B2 B1 B0 Cin S4 S3 S2 S1 S0 VDD GND
Xfa1	A0 B0 Cin C0 S0 VDD GND FullAdd1
Xfa2	A1 B1 C0  C1 S1 VDD GND FullAdd1
Xfa3	A2 B2 C1  C2 S2 VDD GND FullAdd1
Xfa4	A3 B3 C2  S4 S3 VDD GND FullAdd1
.ends
*** Full Adder 5 bits ***
.subckt FullAdd5 A4 A3 A2 A1 A0 B4 B3 B2 B1 B0 Cin S5 S4 S3 S2 S1 S0 VDD GND
Xfa4b	A3 A2 A1 A0 B3 B2 B1 B0 Cin C3 S3 S2 S1 S0 VDD GND FullAdd4
Xfa5	A4 B4 C3 S5 S4 VDD GND FullAdd1
.ends
*** Full Adder 10 bits ***
.subckt FullAdd10 A9 A8 A7 A6 A5 A4 A3 A2 A1 A0 B9 B8 B7 B6 B5 B4 B3 B2 B1 B0 Cin S10 S9 S8 S7 S6 S5 S4 S3 S2 S1 S0 VDD GND
Xfa5b1	A4 A3 A2 A1 A0 B4 B3 B2 B1 B0 Cin C4 S4 S3 S2 S1 S0 VDD GND FullAdd5
Xfa5b2	A9 A8 A7 A6 A5 B9 B8 B7 B6 B5 C4 S10 S9 S8 S7 S6 S5 VDD GND FullAdd5
.ends

*** Flip Flop ***
.subckt DFF D CLK Q VDD GND
Xinv 	CLK CLK_ VDD GND INV
Xdl1	D CLK_ Y VDD GND DLatch_TG
Xdl2	Y CLK  Q VDD GND DLatch_TG
.ends

******************
*** End subckt ***
******************
**********************************************
*** Don't modify the pin name in this file ***
**********************************************

*****************
*** call cell ***
*****************
Xdcim I1 I2 I3 I4 IN_VAL CLK RST O10 O11 O12 O13 O14 O15 O16 O17 O18 O19 O20 O21 O22 O23 O24 O25 O26 O27 O28 O29 OUT_VAL DCIM

*** Initial Weights column 1
.ic V(Xdcim.Xw11.w3)=0v V(Xdcim.Xw11.w2)=0v V(Xdcim.Xw11.w1)=0v V(Xdcim.Xw11.w0)=1.8v
.ic V(Xdcim.Xw12.w3)=0v V(Xdcim.Xw12.w2)=0v V(Xdcim.Xw12.w1)=1.8v V(Xdcim.Xw12.w0)=1.8v
.ic V(Xdcim.Xw13.w3)=0v V(Xdcim.Xw13.w2)=1.8v V(Xdcim.Xw13.w1)=1.8v V(Xdcim.Xw13.w0)=1.8v
.ic V(Xdcim.Xw14.w3)=1.8v V(Xdcim.Xw14.w2)=1.8v V(Xdcim.Xw14.w1)=1.8v V(Xdcim.Xw14.w0)=1.8v
*** Initial Weights column 2
.ic V(Xdcim.Xw21.w3)=0v V(Xdcim.Xw21.w2)=0v V(Xdcim.Xw21.w1)=1.8v V(Xdcim.Xw21.w0)=0v
.ic V(Xdcim.Xw22.w3)=0v V(Xdcim.Xw22.w2)=1.8v V(Xdcim.Xw22.w1)=1.8v V(Xdcim.Xw22.w0)=0v
.ic V(Xdcim.Xw23.w3)=1.8v V(Xdcim.Xw23.w2)=0v V(Xdcim.Xw23.w1)=0v V(Xdcim.Xw23.w0)=0v
.ic V(Xdcim.Xw24.w3)=1.8v V(Xdcim.Xw24.w2)=1.8v V(Xdcim.Xw24.w1)=0v V(Xdcim.Xw24.w0)=0v
******************
*** DCIM block ***
******************
.subckt DCIM I1 I2 I3 I4 IN_VAL CLK RST O10 O11 O12 O13 O14 O15 O16 O17 O18 O19 O20 O21 O22 O23 O24 O25 O26 O27 O28 O29 OUT_VAL
*** Inverse CLK
Xinv0 CLK CLK_ VDD GND INV
*** Weights column 1
Xw11 w113 w112 w111 w110 VDD GND W
Xw12 w123 w122 w121 w120 VDD GND W
Xw13 w133 w132 w131 w130 VDD GND W
Xw14 w143 w142 w141 w140 VDD GND W
*** Weights column 2
Xw21 w213 w212 w211 w210 VDD GND W
Xw22 w223 w222 w221 w220 VDD GND W
Xw23 w233 w232 w231 w230 VDD GND W
Xw24 w243 w242 w241 w240 VDD GND W
*** Input rounds
** Col 1
Xiw11	ii1 w113 w112 w111 w110 o113 o112 o111 o110 VDD GND IdotW
Xiw12	ii2 w123 w122 w121 w120 o123 o122 o121 o120 VDD GND IdotW
Xiw13	ii3 w133 w132 w131 w130 o133 o132 o131 o130 VDD GND IdotW
Xiw14	ii4 w143 w142 w141 w140 o143 o142 o141 o140 VDD GND IdotW
** Col 2
Xiw21	ii1 w213 w212 w211 w210 o213 o212 o211 o210 VDD GND IdotW
Xiw22	ii2 w223 w222 w221 w220 o223 o222 o221 o220 VDD GND IdotW
Xiw23	ii3 w233 w232 w231 w230 o233 o232 o231 o230 VDD GND IdotW
Xiw24	ii4 w243 w242 w241 w240 o243 o242 o241 o240 VDD GND IdotW
*** Adder Tree ***
** Add Col 1 
* I1 I2
Xfa4b1	o113 o112 o111 o110 o123 o122 o121 o120 GND i12_4 i12_3 i12_2 i12_1 i12_0 VDD GND FullAdd4
* I3 I4
Xfa4b2	o133 o132 o131 o130 o143 o142 o141 o140 GND i34_4 i34_3 i34_2 i34_1 i34_0 VDD GND FullAdd4
* 5 bits part
Xfa5b1	i12_4 i12_3 i12_2 i12_1 i12_0 i34_4 i34_3 i34_2 i34_1 i34_0 GND c1_5 c1_4 c1_3 c1_2 c1_1 c1_0 VDD GND FullAdd5

* To 10 bits full adder and cycle with register and shift
Xfa9b1	GND GND GND GND c1_5 c1_4 c1_3 c1_2 c1_1 c1_0 O18 O17 O16 O15 O14 O13 O12 O11 O10 GND GND Px P19 P18 P17 P16 P15 P14 P13 P12 P11 P10 VDD GND FullAdd10
* add into register
*Xrg10	fa19 fa18 fa17 fa16 fa15 fa14 fa13 fa12 fa11 fa10 CLK VDD P19 P18 P17 P16 P15 P14 P13 P12 P11 P10 VDD GND Register10
* Register to Shift
*Xrg11	P18 P17 P16 P15 P14 P13 P12 P11 P10 GND CLK_ RST sh19 sh18 sh17 sh16 sh15 sh14 sh13 sh12 sh11 sh10 VDD GND Register10

** Add Col 2
* I1 I2 
Xfa4b3	o213 o212 o211 o210 o223 o222 o221 o220 GND i212_4 i212_3 i212_2 i212_1 i212_0 VDD GND FullAdd4
* I3 I4
Xfa4b4 	o233 o232 o231 o230 o243 o242 o241 o240 GND i234_4 i234_3 i234_2 i234_1 i234_0 VDD GND FullAdd4
* 5 bits part
Xfa5b2	i212_4 i212_3 i212_2 i212_1 i212_0 i234_4 i234_3 i234_2 i234_1 i234_0 GND c2_5 c2_4 c2_3 c2_2 c2_1 c2_0 VDD GND FullAdd5
* Add and put into output register
Xfa9b2  GND GND GND GND c2_5 c2_4 c2_3 c2_2 c2_1 c2_0 O28 O27 O26 O25 O24 O23 O22 O21 O20 GND GND Py P29 P28 P27 P26 P25 P24 P23 P22 P21 P20 VDD GND FullAdd10

*** OUT_VAL == 1
Xoutnow IN_VAL CLK OUT_VAL VDD GND OUT_NOW

Xcontrol_in I1 I2 I3 I4 CLK IN_VAL ii1 ii2 ii3 ii4 CON_IN
Xcontrol_out1 P10 P11 P12 P13 P14 P15 P16 P17 P18 P19 CLK RST O10 O11 O12 O13 O14 O15 O16 O17 O18 O19 CON_OUT
Xcontrol_out2 P20 P21 P22 P23 P24 P25 P26 P27 P28 P29 CLK RST O20 O21 O22 O23 O24 O25 O26 O27 O28 O29 CON_OUT
.ends

************************
*** input controller ***
************************
.subckt CON_IN I1 I2 I3 I4 CLK IN_VAL ii1 ii2 ii3 ii4
Xand1 I1 IN_VAL out1 VDD GND AND2
Xand2 I2 IN_VAL out2 VDD GND AND2
Xand3 I3 IN_VAL out3 VDD GND AND2
Xand4 I4 IN_VAL out4 VDD GND AND2
Xff1  out1 CLK ii1 VDD GND DFF
Xff2  out2 CLK ii2 VDD GND DFF
Xff3  out3 CLK ii3 VDD GND DFF
Xff4  out4 CLK ii4 VDD GND DFF
*** Your code ***
.ends
*** Add round subcircuit
.subckt IdotW ii w3 w2 w1 w0 o3 o2 o1 o0 VDD GND
Xand1 ii w0 o0 VDD GND AND2
Xand2 ii w1 o1 VDD GND AND2
Xand3 ii w2 o2 VDD GND AND2
Xand4 ii w3 o3 VDD GND AND2
.ends
*************************
*** output controller ***
*************************
.subckt OUT_NOW IN_VAL CLK OUT_VAL VDD GND
Xff1	IN_VAL CLK    Pre_in   VDD GND DFF
Xinv	IN_VAL IN_bar	       VDD GND INV
Xand	Pre_in IN_bar Fall     VDD GND AND2
Xff2	Fall   CLK    OUT_VAL  VDD GND DFF
.ends

.subckt CON_OUT P0 P1 P2 P3 P4 P5 P6 P7 P8 P9 CLK RST O0 O1 O2 O3 O4 O5 O6 O7 O8 O9 
Xand0	P0 RST P00 VDD GND AND2
Xand1   P1 RST P11 VDD GND AND2
Xand2   P2 RST P22 VDD GND AND2
Xand3   P3 RST P33 VDD GND AND2
Xand4   P4 RST P44 VDD GND AND2
Xand5   P5 RST P55 VDD GND AND2
Xand6   P6 RST P66 VDD GND AND2
Xand7   P7 RST P77 VDD GND AND2
Xand8   P8 RST P88 VDD GND AND2
Xand9   P9 RST P99 VDD GND AND2
Xff0	P00 CLK O0 VDD GND DFF
Xff1    P11 CLK O1 VDD GND DFF
Xff2    P22 CLK O2 VDD GND DFF
Xff3    P33 CLK O3 VDD GND DFF
Xff4    P44 CLK O4 VDD GND DFF
Xff5    P55 CLK O5 VDD GND DFF
Xff6    P66 CLK O6 VDD GND DFF
Xff7    P77 CLK O7 VDD GND DFF
Xff8    P88 CLK O8 VDD GND DFF
Xff9    P99 CLK O9 VDD GND DFF
.ends

**************************
*** Simulation setting ***
**************************
Vclk CLK 0 PULSE(0v SupplyV 0 r_time f_time CLK_Period_2 CLK_Period)

Vrst RST 0 PWL 0n SupplyV
+ 'CLK_Period*1.5' SupplyV 'CLK_Period*1.5+f_time' 0v 'CLK_Period*2.5' 0v 'CLK_Period*2.5+r_time' SupplyV
+ 'CLK_Period*6.5' SupplyV 'CLK_Period*6.5+f_time' 0v 'CLK_Period*7.5' 0v 'CLK_Period*7.5+r_time' SupplyV

Vval IN_VAL 0 PWL 0n 0v
+ 'CLK_Period*1' 0v 'CLK_Period*1+f_time' SupplyV 'CLK_Period*5' SupplyV 'CLK_Period*5+r_time' 0v
+ 'CLK_Period*6' 0v 'CLK_Period*6+f_time' SupplyV 'CLK_Period*10' SupplyV 'CLK_Period*10+r_time' 0v

*8 -> 15
VD1 I1 0 PWL 0n 0v
+ 'CLK_Period*1' 0v 'CLK_Period*1+r_time' SupplyV 'CLK_Period*2' SupplyV 'CLK_Period*2+f_time' 0v
+ 'CLK_Period*6' 0v 'CLK_Period*6+r_time' SupplyV 'CLK_Period*10' SupplyV 'CLK_Period*10+f_time' 0v
*2 -> 14
VD2 I2 0 PWL 0n 0v
+ 'CLK_Period*3' 0v 'CLK_Period*3+r_time' SupplyV 'CLK_Period*4' SupplyV 'CLK_Period*4+r_time' 0v
+ 'CLK_Period*6' 0v 'CLK_Period*6+r_time' SupplyV 'CLK_Period*9' SupplyV 'CLK_Period*9+f_time' 0v
*3 -> 13
VD3 I3 0 PWL 0n 0v
+ 'CLK_Period*3' 0v 'CLK_Period*3+r_time' SupplyV 'CLK_Period*5' SupplyV 'CLK_Period*5+f_time' 0v
+ 'CLK_Period*6' 0v 'CLK_Period*6+r_time' SupplyV 'CLK_Period*8' SupplyV 'CLK_Period*8+f_time' 0v
+ 'CLK_Period*9' 0v 'CLK_Period*9+r_time' SupplyV 'CLK_Period*10' SupplyV 'CLK_Period*10+f_time' 0v
*7 -> 12
VD4 I4 0 PWL 0n 0v
+ 'CLK_Period*2' 0v 'CLK_Period*2+r_time' SupplyV 'CLK_Period*5' SupplyV 'CLK_Period*5+r_time' 0v
+ 'CLK_Period*6' 0v 'CLK_Period*6+r_time' SupplyV 'CLK_Period*8' SupplyV 'CLK_Period*8+f_time' 0v

*******************
*** Measurement ***
*******************
.measure TRAN td
+ TRIG V(Xdcim.ii1) VAL=0.9 RISE=1
+ TARG V(Xdcim.P10)  VAL=0.9 RISE=1

.measure TRAN pwr AVG POWER
