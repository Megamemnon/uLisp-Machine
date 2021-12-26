# uLisp-Machine

![image](https://user-images.githubusercontent.com/3956352/145697385-0c8a35ba-d28c-41e0-b04e-0f63ff10d5e0.png)


Originally forked from https://github.com/technoblogy/ulisp-arm. For more information on uLisp see http://www.ulisp.com/. uLisp is available under the MIT License. However, this project is not intended to feed back into uLisp, so it's been recreated as a standalone project, not a fork.

Also uses code from PJRC's USBHost_t36.h which is in the Public Domain.

Not just another Lisp Machine, a MICRO-Lisp Machine! This uLisp Machine uses a regular USB Keyboard and any composite-ready monitor.

This project is functional but development and documentation is ongoing.

## Hardware

uLisp Machine is intended to run on a Teensy 4.1 and takes advantage of the USB Host hardware on that device to accept input from an attached keyboard. It also uses the Serial1 device on Teensy 4.1 for output. The default USB serial connection is still present and supporting both input and output.

A separate project TV Serial Character Display (https://github.com/Megamemnon/TV-Serial-Character-Driver) receives output from the Teensy's Serial1 port and provides composite video of that output.

![image](https://user-images.githubusercontent.com/3956352/145697403-7be1b4b3-fedc-4cdf-87f6-d21031025376.png)

![image](https://user-images.githubusercontent.com/3956352/145697410-8c8b9f0d-cc21-4d80-96d6-ae01b14c756f.png)
I'm using a Tobsun step-down buck converter to 5V (it actually provides about 5.17) from a 12V battery or adapter. 5V and GND from the Tobsun are connected to VIN and GND on the Propeller Project Board (the Propeller provides an NTSC signal of character input sent to its UART, see separate repo). The Propeller Project Board has onboard hardware to provide 3.3v. The 5v feeds the Teensy 4.1 via the 5v pin in order to provide 5v to the onboard USB Host connections. The Teensy's RX and TX (for Serial1) are connected to the Propeller Project Board's TX and RX. 

## Lisp Functions

uLisp already includes tons of functions. See David's website for a language reference: http://www.ulisp.com/show?3L#withsdcard

I've also included Kaef's SD Card Extensions: http://forum.ulisp.com/t/sd-card-extensions-for-ulisp-3-3a-arm-teensy-4-1-board/617

I added the following functions to support the TV Serial Character Display. (In the rather likely event that you don't have a Propeller chip or project board laying around to run the TV Serial Character Display, these functions will have undefined (possibly harmless) behavior.)

- clear-screen          - clears screen and sets cursor position to 0,0

- screen-home           - sets cursor to 0,0
  
- set-cursor-position   - sets cursor to the provided row and column (set-cursor-position row col)
