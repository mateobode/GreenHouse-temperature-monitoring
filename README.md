# GREENHOUSE TEMPERATURE MONITORING

---

## **DESCRIPTION:**
---

Verilog program for a combinational circuit that aims to simulate monitoring in a greenhouse and display it in a visual form (scaled output with LED display). The circuit will always extract the temperatures of the active sensors, perform their arithmetic mean and display the approximate temperature in a coded manner, suitable as an activation signal for each LED bulb, emitting an alarm if the temperature is outside the values admitted.
The input values ​​of all sensors are represented by 8 bits and are concatenated in a bit vector, as follows: [7: 0] - the value of the first sensor, [15: 8] - the value of the second sensor, etc. Each sensor has an enable bit that marks that the value sent by the sensor is valid and readable.
The output of the module will be approximated to the nearest integer and can only be represented in the range [19:26], any value outside this range activating an alarm signal.
