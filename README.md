# 🚀 Cosmic Impalas: DE1-SoC Final Project

**Author:** Alisha Siddiqui  
**Course:** CPEN 412 @ University of British Columbia  
**Project:** Porting and implementing the Cosmic Impalas arcade game on a DE1-SoC FPGA system.


## 🕹 Project Overview

This project involved porting the **Cosmic Impalas** retro arcade game, originally written for the Midway8080 platform, onto a custom hardware and software system based on the **Motorola 68000 (M68K)** CPU running on the **DE1-SoC** FPGA.

The implementation required integrating:
- A VGA graphics subsystem
- A custom pixel buffer memory
- A memory adapter to convert 1-bit Midway8080 graphics to 30-bit RGB format
- Embedded C software to run the game logic


## 🛠 Main Components

- **FPGA Hardware**
  - VGA pixel buffer memory (custom dual-port and shadow memories)
  - Midway8080 memory adapter (combinational logic)
  - SDRAM controller for program memory
  - Hardware timer for clock generation via interrupts

- **Embedded Software**
  - Ported game logic (`cosmic_impalas.c`)
  - Graphics test program (`graphics_test.c`)
  - Hardware timer interrupt handling
  - Display control and player input via hyperterminal


## 🎮 Controls

| Action | Key |
|:---|:---|
| Move Left | `a` |
| Move Right | `d` |
| Fire | `spacebar` |
| Graphics Test | `g` in hyperterminal |
| Start Game | `t` in hyperterminal |

---

## 📦 Project Structure

| Item | Description |
|:---|:---|
| **SOF File Location** | Full project `.sof` and `.mif` files are located in `./sof_code_mif/` <br> Full project with bonus `.sof` and `.mif` files are located in `./sof_code_mif_with_bonus/` |
| **Project Code Location (Hardware & Software)** | Full project code (hardware + software) located in `./` <br> - Hardware files: `MC68K.v`, `midway8080_memory_adapter_code.v`, `pixel_buffer_memory.v`, `shadow_buffer.v` <br> - Software files: `cosmic_impalas.c`, `M68kDebug (no disassembler).c` |
| **Bonus Project Code** | Changes for audio and color bonus located in `./sof_code_mif_with_bonus/` <br> - Additional Hardware: `midway8080_memory_adapter_code.v` <br> - Additional Software: `cosmic_impalas_color_audio.c` |
| **Note** | `MC68K.v` and `M68kDebug (no disassembler).c` accommodate both versions (with and without bonus). |
| **Demo Video** | 📹 [Watch here](https://youtu.be/y7_UQABruYc) |
