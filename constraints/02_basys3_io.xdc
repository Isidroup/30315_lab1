# --------------------------------------------------------------------------------
# Archivo: 02_basys3_io.xdc
# Descripción: Asignación de pines y configuración de voltaje para Basys3
# --------------------------------------------------------------------------------

## Switches (Entradas A y B)
set_property PACKAGE_PIN V17 [get_ports {A[0]}]
set_property PACKAGE_PIN V16 [get_ports {A[1]}]
set_property PACKAGE_PIN W16 [get_ports {A[2]}]
set_property PACKAGE_PIN W17 [get_ports {A[3]}]
set_property PACKAGE_PIN W15 [get_ports {A[4]}]
set_property PACKAGE_PIN V15 [get_ports {A[5]}]
set_property PACKAGE_PIN W14 [get_ports {A[6]}]
set_property PACKAGE_PIN W13 [get_ports {A[7]}]

set_property PACKAGE_PIN V2  [get_ports {B[0]}]
set_property PACKAGE_PIN T3  [get_ports {B[1]}]
set_property PACKAGE_PIN T2  [get_ports {B[2]}]
set_property PACKAGE_PIN R3  [get_ports {B[3]}]
set_property PACKAGE_PIN W2  [get_ports {B[4]}]
set_property PACKAGE_PIN U1  [get_ports {B[5]}]
set_property PACKAGE_PIN T1  [get_ports {B[6]}]
set_property PACKAGE_PIN R2  [get_ports {B[7]}]

## Buttons (Selectores ALU)
set_property PACKAGE_PIN W19 [get_ports {ALU[1]}]
set_property PACKAGE_PIN T17 [get_ports {ALU[0]}]

## LEDs (Salidas)
set_property PACKAGE_PIN XXX [get_ports {SALIDA[0]}]
set_property PACKAGE_PIN XXX [get_ports {SALIDA[1]}]
set_property PACKAGE_PIN XXX [get_ports {SALIDA[2]}]
set_property PACKAGE_PIN XXX [get_ports {SALIDA[3]}]
set_property PACKAGE_PIN XXX [get_ports {SALIDA[4]}]
set_property PACKAGE_PIN XXX [get_ports {SALIDA[5]}]
set_property PACKAGE_PIN XXX [get_ports {SALIDA[6]}]
set_property PACKAGE_PIN XXX [get_ports {SALIDA[7]}]

set_property PACKAGE_PIN XXX  [get_ports {Z}]

# --------------------------------------------------------------------------
# Configuración Eléctrica y de Dispositivo
# --------------------------------------------------------------------------

# Estándar I/O: Aplicamos LVCMOS33 a todos los puertos
# Configuración para Entradas (Switches y Botones)
set_property IOSTANDARD LVCMOS33 [get_ports {A[*] B[*] ALU[*]}]
# Configuración para Salidas (LEDs)
set_property IOSTANDARD LVCMOS33 [get_ports {SALIDA[*] Z}]

# Configuración de compresión de Bitstream y Voltaje de Bancos
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# --------------------------------------------------------------------------
# NOTA SOBRE LA ASIGNACIÓN DE PINES:
# La asignación de pines y la configuración eléctrica aquí definidas
# están específicamente adaptadas para la placa Basys3. Al utilizar
# una FPGA diferente o una placa distinta, es necesario consultar la
# documentación del fabricante para asegurar una asignación correcta
# de pines y una configuración adecuada de los estándares eléctricos.

