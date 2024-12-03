# **Steps**
1. `unzip VLSI_HW3.zip`
2. `cd noxim`
```
noxim/
|-- bin/                # The executable and simulation-related files
|-- config_examples/    # Example configuration files (YAML format)
|-- other/              # Deprecated or experimental files
|-- src/                # source code 
```
3. `cd bin`
    - `cdmod 777 ./noxim`
4. `./noxim -config ../config_examples/default_config.yaml`
5. Exercise 1 : Explain the following terms:
    - Total received Flit
    - Total Received Packet
    - Global Average Delay
    - Network throughput
    - Average IP throughput
6. Exercise 2 : Create a `my_config.yaml` (from `default_config.yaml`), modify some parameters and re-run the simulation with command -- `./noxim -config ../config_examples/my_config.yaml`
    - Exaplain how the parameters below to affect the result in exercise 1
        - packet_size (min & max)
        - packet_injection_rate
        - simulation_time