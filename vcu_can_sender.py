import serial
import time

SOF = 0xAA

def checksum(frame):
    chk = 0
    for b in frame:
        chk ^= b
    return chk

def send_can(port, can_id, data):
    frame = [SOF, can_id, len(data)] + data
    frame.append(checksum(frame))

    ser = serial.Serial(port, 115200, timeout=1)
    ser.write(bytes(frame))
    ser.close()

    print("Sent:", " ".join(f"{b:02X}" for b in frame))

if __name__ == "__main__":
    PORT = "/dev/ttyUSB0"   # đổi nếu cần

    # RUN
    send_can(PORT, 0x01, [])
    time.sleep(1)

    # STATUS
    send_can(PORT, 0x03, [])
    time.sleep(1)

    # STOP
    send_can(PORT, 0x02, [])

