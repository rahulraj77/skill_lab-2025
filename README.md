# skill_lab-2025
RVCE Workshop conducted by VSDSquadron in 6th SEM

## Blinking of LED

Here, the LED changes from RED to Green to Blue and back again to RED continuously.

![Blinking of LED](https://github.com/user-attachments/assets/2345efb1-3ea0-42bf-8cba-09b4c4136e17)

### Turning on Green LED

This turns on the Green LED on the FPGA Mini Board.

![Green_LED_Out](https://github.com/user-attachments/assets/3b0f27c9-aec6-4ed9-9017-9638d3ad36c3)

## UART Simulation

This performs infinite printing of the letter **`R`** continuously.  
The output can be seen by using the command:
```
sudo make terminal
```

![UART_Out](https://github.com/user-attachments/assets/c22421d7-0932-48b2-9d9a-27d9fdd4f4f8)

### UART Simulation using Logic Analyzer

The pin number of `uarttx` is changed from **14** to **4**.  
The pin number of `uartrx` is changed from **15** to **3**.

![Logic Analyzer output](https://github.com/user-attachments/assets/f39c7adf-37f8-4abb-a484-b5bf5ab76db3)

### UART Loopback

The receiver pin is connected to the transmitter pin, so no **instantiation** of the module is required in the code.  
The output of the board is echoed through the command:
```
sudo picocom -b 9600 /dev/ttyUSB0 --echo
```

![UART Loopback Output](https://github.com/user-attachments/assets/f88d1d39-1700-4343-ae53-2404b0cdc7a8)

## Real-time Data Visualization through Ultrasonic Sensor

The data is received from the Ultrasonic sensor to the FPGA using the UART protocol.

![Ultrasonic sensor integration](https://github.com/user-attachments/assets/0efb9588-1f41-4f66-95ae-08263ee9b4a9)