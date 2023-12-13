# EC311_Al-Project
Final Project for EC311

Project Name: Morse to Text Translator

Group Members: Yiwen Wu, Muayad Al-Barwani, Rafi Uddin, Anas Benhamida

Link to Project Demo Video: 

Project Overview: 
This morse to text translator will translate morse code to text. There are 5 input buttons, Dot, Dash, translate, delete, and clear.
The user inputs morse code for one letter at a time and the text output will appear letter by letter on the 7 segment display.

How to run the project:
To run the project, please make sure all files is in the same project directory. Once pushed to a nexys 7 FPGA, the user can input their desired text letter by letter by pressing the 3 input buttons. A dot can be inputed by pressing button P17, a dash by pressing button N17, and then translate by pressing button M17. The desired letter will be displayed. If the user wishes to clear the last typed letter, they can press button P18. If the user wishes to clear everything and start over, they can press button M18. A space can be entered by simply pressing button M17 without a morse code input. 

A summary of the controls is as follows:
Button P17: Dot
Button N17: Dash
Button M17: Translate
Button P18: clear last typed character
Button M18: clear all characters

7 Segment Letter Representations:

<img width="541" alt="Screenshot 2023-12-13 at 4 35 24 PM" src="https://github.com/aabenham/EC311_Al-Project/assets/91548543/e977101c-096a-43e3-a047-4d76f38eaa59">



Overview of the code structure (what code does what):

The system takes user input via 5 buttons on the FPGA board. The button signals run through debouncers afterwhich, their outputs are fed into the morse2text translator module. The morse2text module, based on order of input, will populate 2 registers with binary values, 0 for dot and 1 for dash. these registers are then fed into the FSM which based on how many times each button was pressed, will determine which decoder to use. The decoder will decode the bianary into anode and cathode bit values that can light up the seven segemnt display. 

Block Diagram (full system):

![Morse_Code_Working -  X__Morse_Code_Working_Morse_Code_Working xpr  - Vivado 2022 2 12_13_2023 4_37_27 PM](https://github.com/aabenham/EC311_Al-Project/assets/140469099/27073280-520d-4ec0-8643-fff20849d860)

Block Diagram (fsm with decoder inside):

![Morse_Code_Working -  X__Morse_Code_Working_Morse_Code_Working xpr  - Vivado 2022 2 12_13_2023 4_39_34 PM](https://github.com/aabenham/EC311_Al-Project/assets/140469099/849da4b6-3a5c-4ac3-ae87-42af05bb2021)

