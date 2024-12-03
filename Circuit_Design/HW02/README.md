# **Target**
- 3 input XOR gate, drives a capacitance of 0.005pF
# **Limitations**
1. VDD = 1.8v
2. Temperature = $30 ^\circ C$
3. Capacitive of output S = 0.005pF
4. Transistors
    - L = 0.18um
    - W >= 0.25um
5. Input, `(C,B,A)` : `(0,0,0)` $\to$ `(1,1,1)`
    - 50% duty cycle
    - **A** = **200 MHz**, **B** = **100 MHz**, **C** = **50 MHz**
    - **Rise/Fall time** of input signals = **10ps** 
6. Output
    - Highest voltage >= 0.9 VDD
    - Lowest voltage <= 0.1 VDD
7. DRC Rules
    - cont width and length = $0.23 \,\mu m$
    - Spacing between cont and diff > $0.12 \,\mu m$
    - Spacing between Pimp/Nimp and diff > $0.2 \,\mu m$
    - Spacing between poly and cont > $0.14\,\mu m$
    - Spacing between metal and metal > $0.24\,\mu m$
    - Spacing between cont and cont > $0.25\,\mu m$
# **Common commands & steps**
1. Decompression the file spice_layout.tar
    - `tar xvf spice_layout.tar`
        - This will give 2 folders (layout,spice)
    - setting
        - Add `/home/VLSI_1131/tsx1136010/hw02/layout/calibre/` to `Rule_20KA.rc` and `Rule_08KA.rc`
2. Create backup file **(after setting)**
    - `tar cvf spice_layout_backup.tar spice layout`
        - Pack spice and layout into spice_layout_backup.tar
3. Source hspice
    - `source /usr/cad/synopsys/CIC/hspice.cshrc`
    - Simulation:`hspice -i hw2_xor_pre.sp -o ./hw2/hw2.lis`
4. Source waveview
    - `source /usr/cad/synopsys/CIC/customexplorer.cshrc`
    - Show waveview : `vw file.tr0`
5. Source virtuoso
    - `source /usr/cad/cadence/CIC/ic.cshrc`
    - `source /usr/cad/mentor/CIC/calibre.cshrc`
6. Modify pre-sim files
    - Put `inv.sp/hw2.sp/tb.sp...` into `/spice/pre_sim/hw2`
7. Open virtuoso
    - `cd layout`
    - `icfb &`
8. Construct new library
9. Construct new cell view