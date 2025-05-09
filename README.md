# skill_lab-2025
RVCE Workshop conducted by VSDSquadron in 6th SEM

## Turning on Green LED

This performs blinking of Green LED for the FPGA Mini Board

## UART Simulation

This performs infinite printing of letter **`R`** continuously.
The output can be seen by using the command ``` sudo make terminal ```

### UART Simulation using Logic Analyzer 

The pin number of `uarttx` is changed from **14** to  **4**. <b>
The pin number of `uartrx` is changed from **15** to  **3**. <b>

## UART Loopback

The receiver pin is connected to transmitter pin, hence no **instantiation** of module is required in the code.
The output of board is echoed through the command **``` sudo picocom -b 9600 /dev/ttyUSB0 --echo ```** 