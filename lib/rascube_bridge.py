import serial
import sys
import os

os.environ['OPENC3_NO_STORE'] = '1'

from openc3.interfaces.tcpip_server_interface import TcpipServerInterface
from openc3.packets.packet import Packet

if len(sys.argv) < 2:
    print("Usage: python rascube_bridge.py <serial_port> [network port]")
    sys.exit(1)

port = 2945
if len(sys.argv) > 2:
    port = sys.argv[2]

a = TcpipServerInterface(port, port, 10, None, 'BURST')
a.connect()

# Wait for Serial number set command
print("Waiting for serial number...")
sn_packet = a.read()
print(f"Received serial number: {sn_packet.buffer}")

if sn_packet is not None:
    with serial.Serial(sys.argv[1], 1000000) as ser:
        # Set serial number
        print("Writing serial number to device...")
        ser.write(sn_packet.buffer)

        print("Waiting for serial data...")
        while True:
            data = ser.read(255)
            packet = Packet()
            packet.buffer = data
            a.write(packet)
