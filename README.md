# MCU–VCU Communication and Automotive IPC

**Technologies:** STM32, Embedded C/C++, UART, Embedded Linux, Yocto, Qt/QML

## Overview

This project develops an embedded automotive system that integrates an STM32-based MCU with a Vehicle Control Unit (VCU) and an Instrument Panel Cluster (IPC).

The MCU acquires and processes sensor data, then transmits vehicle information to the VCU via UART. The VCU receives and parses the data before updating the IPC interface, developed with Qt/QML and deployed on a Raspberry Pi 3 running Embedded Linux.

## Key Features

- Develop STM32 firmware for sensor acquisition and data processing.
- Implement UART communication and data frame packaging/parsing between MCU and VCU.
- Process received vehicle data and integrate it with the IPC application.
- Develop a Qt/QML interface with a C++ backend.
- Build and deploy Embedded Linux using Yocto Project.

## System Architecture

```text
Sensors → STM32 MCU → UART → VCU → Qt/QML IPC
                                  |
                           Raspberry Pi 3
                           Embedded Linux
```

## Technologies

- **Firmware:** Embedded C, STM32
- **Communication:** UART
- **Application:** C++, Qt/QML
- **Platform:** Raspberry Pi 3, Embedded Linux, Yocto Project

## Repository

[GitHub – IPC_Automotive](https://github.com/KienNT0501/IPC_Automotive)
