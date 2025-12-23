# Lab 1 - ALU en VHDL para Basys3

Laboratorio de diseño digital - Implementación de una ALU (Arithmetic Logic Unit) simple en VHDL para la placa Basys3 (Xilinx Artix-7).

## 📋 Descripción

Este proyecto implementa una Unidad Aritmético-Lógica (ALU) de 8 bits que realiza operaciones básicas:

- **Suma** (`ALU = 00`): A + B
- **XOR** (`ALU = 01`): A XOR B
- **Bypass** (`ALU = 10/11`): Salida = B

La ALU también incluye la salida **Z** (Zero flag) que se activa cuando el resultado es `00000000`.

## 🗂️ Estructura del Proyecto

```
.
├── constraints/          # Restricciones de diseño
│   ├── 01_timing.xdc     # Restricciones temporales (reloj virtual 50 MHz)
│   └── 02_basys3_io.xdc  # Asignación de pines para Basys3
├── doc/                  # Documentación
├── rtl/                  # Código fuente RTL
│   └── alu.vhd           # Implementación de la ALU
├── scripts/              # Scripts de automatización
│   └── lab.tcl           # Script para crear el proyecto en Vivado
├── sim/                  # Archivos de simulación
│   └── alu_tb.vhd        # Testbench para la ALU
└── vivado/               # Directorio del proyecto Vivado (generado)
```

## 🚀 Uso

### Crear el Proyecto en Vivado

Desde Vivado TCL Console:

1. Abrir Vivado
2. En el menú ir a `tools -> Run TCL Script...`
3. Seleccionar el script `scripts/lab.tcl` y ejecutarlo.

### Ejecutar Simulación

1. Abrir el proyecto en Vivado
2. En Flow Navigator → Simulation, seleccionar **Run Behavioral Simulation**
3. Observar las señales en el testbench

### Síntesis e Implementación

1. **Run Synthesis** - Sintetiza el diseño
2. **Run Implementation** - Implementa en el dispositivo target
3. **Generate Bitstream** - Genera el archivo `.bit`
4. Programar la placa Basys3 con el bitstream generado

## 🔌 Mapeo de Hardware (Basys3)

| Señal         | Hardware      | Descripción               |
|---------------|---------------|---------------------------|
| `A[7:0]`      | Switches 15-8 | Operando A                |
| `B[7:0]`      | Switches 7-0  | Operando B                |
| `ALU[1:0]`    | Botones       | Selector de operación     |
| `SALIDA[7:0]` | LEDs          | Resultado de la operación |
| `Z`           | LED adicional | Bandera de resultado cero |

## ⚙️ Especificaciones Técnicas

- **FPGA**: Xilinx Artix-7 (xc7a35tcpg236-1)
- **Placa**: Digilent Basys3
- **Lenguaje**: VHDL
- **Ancho de datos**: 8 bits


## 📊 Operaciones de la ALU

| ALU[1:0] | Operación | Resultado |
|----------|-----------|-----------|
| `00`     | ADD       | A + B     |
| `01`     | XOR       | A XOR B   |
| `10`     | BYPASS    | B         |
| `11`     | BYPASS    | B         |

## 🧪 Testing

El testbench [alu_tb.vhd](sim/alu_tb.vhd) incluye casos de prueba para:

- Operaciones aritméticas (suma)
- Operaciones lógicas (XOR)
- Condiciones de overflow
- Activación de la bandera Z

## 📚 Referencias

- [Basys3 Reference Manual](https://digilent.com/reference/programmable-logic/basys-3/reference-manual)
- [Vivado Design Suite User Guide](https://www.xilinx.com/support/documentation-navigation/design-hubs/dh0010-vivado-design-hub.html)

## 👨‍🏫 Curso

**Asignatura**: 30315 - Electrónica Digital  
**Laboratorio**: Lab 1 - ALU Básica

---

*Última modificación: Diciembre 2025*
