# skill_lab-2025
RVCE Workshop conducted by VSDSquadron in 6th SEM


## Blinking of LED

Here, the LED changes from RED to Green to Blue and back again to RED continuosly


![Blinking of LED](https://github.com/user-attachments/assets/2345efb1-3ea0-42bf-8cba-09b4c4136e17)


### Turning on Green LED

This performs turning on Green LED for the FPGA Mini Board


![Green_LED_Out](https://github.com/user-attachments/assets/3b0f27c9-aec6-4ed9-9017-9638d3ad36c3)


## UART Simulation

This performs infinite printing of letter **`R`** continuously.
The output can be seen by using the command ``` sudo make terminal ```

![UART_Out](https://github.com/user-attachments/assets/c22421d7-0932-48b2-9d9a-27d9fdd4f4f8)


### UART Simulation using Logic Analyzer 

The pin number of `uarttx` is changed from **14** to  **4**. <b>
The pin number of `uartrx` is changed from **15** to  **3**. <b>

![Logic Analyzer output](https://github.com/user-attachments/assets/f39c7adf-37f8-4abb-a484-b5bf5ab76db3)


### UART Loopback

The receiver pin is connected to transmitter pin, hence no **instantiation** of module is required in the code.
The output of board is echoed through the command **``` sudo picocom -b 9600 /dev/ttyUSB0 --echo ```**

![UART Loopback Output](https://github.com/user-attachments/assets/f88d1d39-1700-4343-ae53-2404b0cdc7a8)


## Real time Data Visualization through Ultrasonic sensor

The data is received from Ultrasonic sensor to FPGA using UART Protocol

![Ultrasonic sensor integration](https://github.com/user-attachments/assets/0efb9588-1f41-4f66-95ae-08263ee9b4a9)



## Integration of Ultrasonic Sensor

The real-time data is been tracked from the ultrasonic sensor and is displayed in the terminal using the command 