# **Digital Computation-in-Memory (DCIM)**
## **Target & setting**
- Target : Design a 4-rows x 2-columns DCIM macro for vector-matrix multiplications.
- Input : I1,I2,I3,I4, each having 4 bits, sent 1 bit per cycle
    - From most significant bit to the least significant bit
    - After 4 cycles generate an output
- Control signals : CLK,RST,IN_VAL
    - CLK : clock, period = 2ns
    - RST : asynchronous active-low reset
    - IN_VAL : active-high for input valid
- Output : O1,O2,OUT_VAL
    - O1,O2 : 10-bits, represent the result for column 1 and 2
    - OUT_VAL : active-high for output valid
- Environment setting : VDD = 1.8v, VSS = 0v
## **Descriptions**
- Input vector
    - $I_1,I_2,I_3,I_4$
    - 4 bits each vector
    - 1 bit per cycle
    - 4 cycles to generate an output
- Weights matrix (W)
    - 4-rows x 2-columns
    - All weights are 4 bits
    - Initial conditions (.ic)
        - Column 1 : $(W_{11},W_{12},W_{13},W_{14})_1 = (1,3,7,15)_1$
        - Column 2 : $(W_{21},W_{22},W_{23},W_{24})_1 = (2,6,8,12)_1$

$(  ( W_{11},W_{12},W_{13},W_{14} ) ._1,
    ( W_{21},W_{22},W_{23},W_{24} ) ._2 )$

- Output 
    - O1,O2
    - 10 bits each
    - $O1 = (I_1 * W_{11}) + (I_2 * W_{12}) + (I_3 * W_{13}) + (I_4 * W_{14})$
    - $O2 = (I_1 * W_{21}) + (I_2 * W_{22}) + (I_3 * W_{23}) + (I_4 * W_{24})$
## **Limitations**
1. VDD = 1.8v
2. VSS = 0v
3. Operating temperature = $30 ^\circ C$
4. L = 0.18um
5. NMOS's W = 0.36um
6. PMOS's W = 0.72um

## **Hint**
1. You may add buffers to strengthen the output valtage if necessary