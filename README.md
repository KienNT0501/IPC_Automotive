# MCU–VCU Communication and Automotive Instrument Panel Cluster (IPC)

**Embedded Automotive System | STM32 | UART | Embedded Linux | Yocto | Qt/QML**

## 1. Overview

This project demonstrates an embedded automotive system that integrates a microcontroller-based sensor acquisition and processing unit with a Vehicle Control Unit (VCU) and an Instrument Panel Cluster (IPC) running on Embedded Linux.

The MCU collects sensor data, processes the acquired signals, and transmits vehicle information to the VCU through a UART communication interface. The VCU receives and parses the incoming data frames, processes the decoded information, and updates the IPC user interface in real time.

The IPC application is developed using Qt/QML and deployed on a Raspberry Pi 3 running a custom Embedded Linux image built with Yocto Project.

The main objective is to demonstrate embedded firmware development, peripheral communication, data protocol design, and integration between a real-time microcontroller and a Linux-based automotive HMI.

## 2. System Architecture

```text
+---------------------------+
|       Sensors / Inputs    |
+-------------+-------------+
              |
              v
+---------------------------+
|       STM32 MCU           |
|                           |
| - Sensor Acquisition      |
| - Signal Processing       |
| - Vehicle Data Management |
| - UART Communication      |
+-------------+-------------+
              |
              | UART
              | TX / RX
              v
+---------------------------+
|           VCU             |
|                           |
| - UART Data Reception     |
| - Frame Parsing           |
| - Data Validation         |
| - Vehicle State Update    |
+-------------+-------------+
              |
              v
+---------------------------+
|     Vehicle Service       |
|       C++ Backend         |
+-------------+-------------+
              |
              v
+---------------------------+
|      Qt/QML IPC UI        |
|                           |
| - Vehicle Status          |
| - Sensor Information      |
| - Instrument Visualization|
+---------------------------+

     Raspberry Pi 3
     Embedded Linux
     Yocto Project
```

### Data Flow

1. **Sensor Acquisition:** The STM32 MCU acquires sensor signals through the appropriate peripherals.
2. **Data Processing:** The MCU processes the acquired data and prepares vehicle information for transmission.
3. **Frame Packaging:** The firmware encodes the data into a predefined UART communication frame.
4. **UART Transmission:** The MCU transmits the frame to the VCU.
5. **Data Reception:** The VCU receives incoming UART data and reconstructs the communication frame.
6. **Frame Parsing:** The VCU extracts and validates the vehicle data according to the communication protocol.
7. **Backend Processing:** The C++ vehicle service makes the processed data available to the application layer.
8. **HMI Update:** The Qt/QML interface presents the latest vehicle information to the user.

## 3. Key Features

### MCU Firmware Development
- Develop embedded firmware in C for the STM32 microcontroller.
- Configure and use MCU peripherals for sensor acquisition and communication.
- Implement UART-based data transmission.
- Package sensor information into structured communication frames.
- Separate peripheral handling, application logic, and communication processing into modular components.

### UART Communication Protocol
- Implement UART-based communication between the MCU and VCU.
- Define a structured data frame for exchanging vehicle information.
- Handle incoming and outgoing data through the communication interface.
- Parse received frames and extract application-level data.
- Separate communication handling from vehicle data processing.

### VCU Data Processing
- Receive UART data from the MCU.
- Decode communication frames and extract sensor information.
- Convert received data into application-level vehicle states.
- Provide processed vehicle information to the IPC application.

### Embedded Linux and IPC Development
- Build and configure a custom Embedded Linux image using Yocto Project.
- Deploy the Linux image on a Raspberry Pi 3.
- Develop the IPC interface using Qt/QML.
- Integrate the QML user interface with a C++ backend.
- Display vehicle information received from the MCU through the VCU communication pipeline.

## 4. Hardware and Software

| Component | Technology |
|---|---|
| Microcontroller | STM32 |
| MCU Firmware | Embedded C |
| Communication Interface | UART |
| Vehicle Control Unit | C++ application / communication processing |
| Embedded Platform | Raspberry Pi 3 |
| Operating System | Embedded Linux |
| Linux Build System | Yocto Project |
| User Interface | Qt/QML |
| Application Backend | C++ |
| Development Tools | STM32 development tools, Linux development environment |

## 5. Software Architecture

The system is organized into multiple layers to separate hardware access, communication, application processing, and user interface responsibilities.

### MCU Firmware

The MCU firmware is responsible for acquiring sensor data, processing signals, and transmitting vehicle information. The communication module handles UART transmission and the construction of data frames.

### VCU Communication and Application Layer

The VCU communication layer receives UART data, parses the protocol frame, and converts the payload into meaningful vehicle information. The application layer then provides the updated state to the IPC backend.

### IPC Application Layer

The IPC application uses a C++ backend to manage application data and expose it to the Qt/QML presentation layer. QML is responsible for rendering the instrument panel and presenting vehicle information.

### Embedded Linux Platform

The Raspberry Pi 3 runs an Embedded Linux image generated using Yocto Project. This platform hosts the IPC application and its supporting runtime environment.

## 6. UART Communication Workflow

The communication workflow follows a producer-consumer model.

**MCU — Data Producer**
- Acquire sensor data.
- Process and prepare the data.
- Construct a communication frame.
- Transmit the frame over UART.

**VCU — Data Consumer**
- Receive the UART byte stream.
- Identify and reconstruct complete frames.
- Extract and validate the payload.
- Update the corresponding vehicle state.
- Notify or update the application backend.

The communication protocol defines how the receiver interprets the transmitted bytes. Frame structure, data types, field ordering, and validation rules must be consistent between the MCU and VCU.

## 7. Design Considerations

The project involves several important embedded systems engineering considerations:

- **Peripheral Configuration:** Correct configuration of UART, GPIO, clocks, and other peripherals used by the firmware.
- **Communication Reliability:** Handling partial frames, continuous byte streams, and invalid or incomplete data.
- **Data Integrity:** Ensuring that received data is interpreted according to the agreed communication format.
- **Modular Design:** Separating hardware drivers, communication logic, application processing, and presentation.
- **Cross-Platform Integration:** Connecting MCU firmware with a C++ application running on Embedded Linux.
- **Resource Constraints:** Considering MCU memory, processing time, communication latency, and Linux application responsiveness.
- **Deployment:** Building and configuring a reproducible Embedded Linux environment using Yocto Project.

## 8. Skills Demonstrated

- Embedded C and C++ programming
- STM32 peripheral configuration and firmware development
- UART communication and protocol implementation
- Sensor data acquisition and processing
- Communication frame packaging and parsing
- Embedded Linux system integration
- Yocto Project image configuration and build
- Qt/QML user interface development
- C++ backend and application integration
- Hardware-software integration and debugging

## 9. Repository

GitHub: [IPC_Automotive](https://github.com/KienNT0501/IPC_Automotive)

Explore the repository for the firmware, communication implementation, and IPC application source code.

## 10. Project Goal

The project aims to demonstrate an end-to-end embedded automotive data pipeline, from sensor acquisition on a microcontroller to vehicle information visualization on a Linux-based instrument panel.

It combines low-level firmware development, serial communication, application-layer data processing, and graphical interface development in a single embedded system.
