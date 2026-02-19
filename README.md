# Lab 1 - ALU en VHDL para Basys3

Laboratorio de diseño digital - Implementación de una ALU (Arithmetic Logic Unit) simple en VHDL para la placa Basys3 (Xilinx Artix-7).

## 📋 Descripción General

Este proyecto implementa una **Unidad Aritmético-Lógica (ALU) de 8 bits** que realiza operaciones combinacionales básicas.

### Características Principales

- **Operaciones soportadas**: Suma, XOR, Bypass
- **Ancho de datos**: 8 bits
- **Bandera Zero**: Detección de resultado nulo
- **Control**: 2 bits de selección de operación
- **Plataforma**: FPGA Xilinx Basys3 (Artix-7)

---

## 📁 Estructura del Proyecto

```
30315_lab1/
├── README.md              # Este archivo
├── constraints/           # Restricciones de diseño
│   ├── 01_timing.xdc      # Restricciones temporales (reloj virtual 50 MHz)
│   └── 02_basys3_io.xdc   # Asignación de pines para Basys3
├── doc/                   # Documentación adicional
├── rtl/                   # Código fuente RTL
│   └── alu.vhd            # Implementación de la ALU
├── scripts/               # Scripts de automatización
│   └── lab.tcl            # Script TCL para crear el proyecto en Vivado
├── sim/                   # Archivos de simulación
│   └── alu_tb.vhd         # Testbench para la ALU
└── vivado/                # Proyecto Vivado (generado al ejecutar el script)
```

---

## 🔧 Especificaciones Técnicas

### Entradas

| Puerto     | Ancho  | Tipo | Descripción           |
|------------|--------|------|-----------------------|
| `A[7:0]`   | 8 bits | in   | Operando A            |
| `B[7:0]`   | 8 bits | in   | Operando B            |
| `ALU[1:0]` | 2 bits | in   | Selector de operación |

### Salidas

| Puerto        | Ancho  | Tipo | Descripción                            |
|---------------|--------|------|----------------------------------------|
| `SALIDA[7:0]` | 8 bits | out  | Resultado de la operación              |
| `Z`           | 1 bit  | out  | Bandera Zero (activa si resultado = 0) |

### Información del Dispositivo

- **FPGA**: Xilinx Artix-7 (xc7a35tcpg236-1)
- **Placa**: Digilent Basys3
- **Lenguaje**: VHDL
- **Reloj virtual**: 50 MHz (para análisis de timing)

---

## 📊 Operaciones de la ALU

| ALU[1:0] | Operación | Resultado | Descripción                    |
|----------|-----------|-----------|--------------------------------|
| `00`     | ADD       | A + B     | Suma aritmética de 8 bits      |
| `01`     | XOR       | A XOR B   | XOR lógico bit a bit           |
| `10`     | BYPASS    | B         | Pasa el operando B a la salida |
| `11`     | BYPASS    | B         | Pasa el operando B a la salida |

**Nota**: La bandera `Z` se activa (Z = '1') cuando el resultado es `00000000`.

---

## 🚀 Uso

### Crear el Proyecto en Vivado

#### Opción 1: Usar el script TCL desde Vivado GUI

1. Abrir **Vivado**
2. Seleccionar **Tools → Run Tcl Script**
3. Navegar a `scripts/lab.tcl` y ejecutarlo
4. El proyecto se creará automáticamente en `vivado/`

#### Opción 2: Ejecutar el script desde línea de comandos

```bash
# Desde el directorio del proyecto
vivado -mode batch -source scripts/lab.tcl
```

#### Opción 3: Ejecutar manualmente en la consola TCL de Vivado

1. Abrir Vivado
2. En la **TCL Console**, ejecutar:
   ```tcl
   source scripts/lab.tcl
   ```

### Simulación

#### Con Vivado

1. Abrir el proyecto: `vivado vivado/lab.xpr`
2. En Flow Navigator → Simulation → **Run Behavioral Simulation**
3. Observar las formas de onda en el testbench

### Síntesis e Implementación

1. **Run Synthesis** - Sintetiza el diseño
2. **Run Implementation** - Implementa en el dispositivo target
3. **Generate Bitstream** - Genera el archivo `.bit`

### Programación de la Basys3

1. Conectar la placa Basys3 por USB
2. Abrir **Hardware Manager** en Vivado
3. Programar el dispositivo con el bitstream generado

### Operación en Hardware

1. Configurar operando A en **switches SW[15:8]**
2. Configurar operando B en **switches SW[7:0]**
3. Seleccionar operación con **botones** (ALU[1:0])
4. Observar resultado en **LEDs [7:0]**
5. Verificar bandera Z en **LED adicional**

---

## 🔌 Mapeo de Hardware (Basys3)

| Señal         | Hardware      | Pines    | Descripción               |
|---------------|---------------|----------|---------------------------|
| `A[7:0]`      | Switches 15-8 | SW15-SW8 | Operando A                |
| `B[7:0]`      | Switches 7-0  | SW7-SW0  | Operando B                |
| `ALU[1:0]`    | Botones       | BTN[1:0] | Selector de operación     |
| `SALIDA[7:0]` | LEDs 7-0      | LD7-LD0  | Resultado de la operación |
| `Z`           | LED adicional | LD8      | Bandera de resultado cero |

**Ubicación de constraints**: [02_basys3_io.xdc](constraints/02_basys3_io.xdc)

---

## 📚 Documentación

### Archivos Principales

| Archivo                                                      | Descripción                     |
|--------------------------------------------------------------|---------------------------------|
| [rtl/alu.vhd](rtl/alu.vhd)                                   | Implementación de la ALU        |
| [sim/alu_tb.vhd](sim/alu_tb.vhd)                             | Testbench para verificación     |
| [scripts/lab.tcl](scripts/lab.tcl)                           | Script de creación del proyecto |
| [constraints/02_basys3_io.xdc](constraints/02_basys3_io.xdc) | Mapeo de pines I/O              |
| [constraints/01_timing.xdc](constraints/01_timing.xdc)       | Restricciones de timing         |

### Casos de Prueba

El testbench [alu_tb.vhd](sim/alu_tb.vhd) incluye:

- Operaciones aritméticas (suma con y sin desbordamiento)
- Operaciones lógicas (XOR)
- Modo bypass
- Activación de la bandera Z

### Referencias Externas

- [Basys3 Reference Manual](https://digilent.com/reference/programmable-logic/basys-3/reference-manual)
- [Vivado Design Suite User Guide](https://www.xilinx.com/support/documentation-navigation/design-hubs/dh0010-vivado-design-hub.html)

---

## 📋 Requisitos

### Hardware
- FPGA Xilinx Basys3
- Cable USB para programación

### Software
- Vivado Design Suite (2019.x o superior)
- ModelSim (opcional, para simulación)
- VHDL-93/2008 compatible

---

## 📝 Notas Importantes

⚠️ **Reloj virtual**: El design no utiliza reloj, pero se define un reloj virtual de 50 MHz en `01_timing.xdc` para análisis estático de timing.

⚠️ **Diseño combinacional**: La ALU es puramente combinacional (sin registros).

⚠️ **Overflow**: La suma no tiene protección contra overflow. El resultado se trunca a 8 bits.

---

## 👨‍🏫 Información del Curso

**Asignatura**: 30315 - Electrónica Digital (EDIG)
**Laboratorio**: Lab 1 - ALU Básica
**Plataforma**: Basys3 (Artix-7 XC7A35T)

---

*Última actualización: Febrero 2026*
