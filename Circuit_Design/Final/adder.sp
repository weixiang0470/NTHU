* Adder

.lib 'cic018.l' tt

************full_adder*******************
.subckt full_adder vdd gnd a b c cout s
M1  x1  a vdd vdd P_18 l=0.18u w=0.75u m=1
M2  x1  b vdd vdd P_18 l=0.18u w=0.75u m=1
M3  x3  a vdd vdd P_18 l=0.18u w=0.75u m=1
M4  cob b x3  vdd P_18 l=0.18u w=0.75u m=1
M5  cob c x1  vdd P_18 l=0.18u w=0.75u m=1

M6  cob c x2  gnd N_18 l=0.18u w=0.25u m=1
M7  x2  a gnd gnd N_18 l=0.18u w=0.25u m=1
M8  x2  b gnd gnd N_18 l=0.18u w=0.25u m=1
M9  cob b x4  gnd N_18 l=0.18u w=0.25u m=1
M10 x4  a gnd gnd N_18 l=0.18u w=0.25u m=1

M11 x5  a vdd vdd P_18 l=0.18u w=0.75u m=1
M12 x5  b vdd vdd P_18 l=0.18u w=0.75u m=1
M13 x5  c vdd vdd P_18 l=0.18u w=0.75u m=1
M14 sb  cob x5 vdd P_18 l=0.18u w=0.75u m=1

M15 sb cob x6 gnd N_18 l=0.18u w=0.25u m=1
M16 x6 a gnd gnd N_18 l=0.18u w=0.25u m=1
M17 x6 b gnd gnd N_18 l=0.18u w=0.25u m=1
M18 x6 c gnd gnd N_18 l=0.18u w=0.25u m=1

M19 cout cob vdd vdd P_18 l=0.18u w=0.75u m=1
M20 cout cob gnd gnd N_18 l=0.18u w=0.25u m=1

M21 x7 a vdd vdd P_18 l=0.18u w=0.75u m=1
M22 x8 b x7  vdd P_18 l=0.18u w=0.75u m=1
M23 sb c x8  vdd P_18 l=0.18u w=0.75u m=1

M24 sb c  x9  gnd N_18 l=0.18u w=0.25u m=1
M25 x9 b  x10 gnd N_18 l=0.18u w=0.25u m=1
M26 x10 a gnd gnd N_18 l=0.18u w=0.25u m=1

M27 s sb vdd vdd P_18 l=0.18u w=0.75u m=1
M28 s sb gnd gnd N_18 l=0.18u w=0.25u m=1
.ends
*****************************************

*********SUB_CIRCUIT*********
X1 VDD GND A1 B1 Cin C1   S1 full_adder
X2 VDD GND A2 B2 C1  C2   S2 full_adder
X3 VDD GND A3 B3 C2  C3   S3 full_adder
X4 VDD GND A4 B4 C3  Cout S4 full_adder
*****************************

**********INDEPENDENT SOURCE*******
VDD VDD 0 DC 1.8V
VSS GND 0 DC 0V

*a)**
*Vin1 A1 0 pulse(0 1.8 0 1.25n 1.25n 100n 200n)
*Vin2 A2 0 DC 0V
*Vin3 A3 0 DC 0V
*Vin4 A4 0 DC 0V
*Vin5 B1 0 pulse(0 1.8 0 1.25n 1.25n 100n 200n)
*Vin6 B2 0 DC 0V
*Vin7 B3 0 DC 0V
*Vin8 B4 0 DC 0V
*Vin9 Cin 0 DC 0V

*b)**
*Vin1 A1 0 pulse(0 1.8 0 1.25n 1.25n 100n 200n)
*Vin2 A2 0 pulse(0 1.8 0 1.25n 1.25n 100n 200n)
*Vin3 A3 0 pulse(0 1.8 0 1.25n 1.25n 100n 200n)
*Vin4 A4 0 pulse(0 1.8 0 1.25n 1.25n 100n 200n)
*Vin5 B1 0 pulse(0 1.8 0 1.25n 1.25n 100n 200n)
*Vin6 B2 0 DC 0V
*Vin7 B3 0 DC 0V
*Vin8 B4 0 DC 0V
*Vin9 Cin 0 DC 0V

*c)**
Vin1 A1 0 pulse(0 1.8 0 1.25n 1.25n 100n 200n)
Vin2 A2 0 DC 0V
Vin3 A3 0 pulse(0 1.8 0 1.25n 1.25n 100n 200n)
Vin4 A4 0 DC 0V
Vin5 B1 0 DC 0V
Vin6 B2 0 pulse(0 1.8 0 1.25n 1.25n 100n 200n)
Vin7 B3 0 DC 0V
Vin8 B4 0 pulse(0 1.8 0 1.25n 1.25n 100n 200n)
Vin9 Cin 0 DC 0V
***********************************

.op
.option post

.tran 1n 1u

.end




