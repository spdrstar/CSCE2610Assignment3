# CSCE 2610 Assignment 3
The 3rd short assignment for my entry level Assembly class

The version of assembly used on this assignment is ARMv8.

This program was tested in ARMSim#.191

It should work in all test cases.

# Setup
To start:
 1. Download [ARMSim](http://armsim.cs.uvic.ca/DownloadARMSimSharp.html)
 2. Download the file from this git repo through the zip button on this page or clone it with the command below
     
     ```
     $ git clone https://github.com/spdrstar/CSCE2610Assignment3.git
     ```

# Adding values
This assembly program divides the data at the bottom of the file.

To change the data:
  1. edit the Y .word to your desired dividend
  2. edit the X .word to your desired divisor
  3. change the D .asciz with the new values
  
# Running the program
If you choose to use ARMSim, these are the instructions to test the program.

1. Open ArmSim
2. Click File in the topbar
3. Click Load in the dropdown list
4. Navigate to where you saved the file
5. Click Run on the bar below the topbar (It is a square with a play symbol inside)
6. In the OutputView below the code, click on "Stdin/Stdout/Stderr"
7. You should see the desired output

# Sample Test Cases
Below are my sample test cases to demonstrate the program

Test Case 1: 18/3 

Desired output: 18 DIV 3 = (Q = 6, R = 0)

Screenshot:

![18 Divded by 3](CSCE2610Assignment3/18DIV3.PNG)

