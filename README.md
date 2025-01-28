# Floating-Point-Calculator-FPGA

## FloatingPointAdd Module Summary

This module performs floating-point addition by aligning mantissas, adding them, and adjusting the exponent based on the result. Each submodule focuses on a specific task, making the design modular and efficient. The instantiation names clearly represent their roles, enhancing readability and maintainability.

### Modules within FloatPointAdd

MantissaShifterMux: Handles mantissa shifting through a multiplexer.

ModExponentSubtractor: Subtracts the exponents of the inputs.

MantissaAdderMUX: Handles mantissa addition using a multiplexer.

MantissaRightShifter: Shifts the mantissa for alignment.

ExponentINCMUX: Manages exponent selection and increment.

CarryLookAheadAdder: Adds the mantissas efficiently using a CLA algorithm.

ControlledExIncrementor: Increments the exponent based on carry-out.

MantissaNormalBitShifter: Normalizes the mantissa.



## LCD_Board_Test_LCD Module Summary

The LCD_Board_Test_LCD module is built to handle user inputs from a keypad, execute floating-point addition, and display both the inputs and the result on an LCD. The design is modular, with each submodule dedicated to a specific function, such as capturing input, storing values, performing arithmetic operations, and managing the LCD display. A detailed explanation of the module's functionality is provided below.

### Modules within LCD_Board_test_LCD
inputMod: Handles keypad input and generates the input value (A).

NbitRegisterSVA & NbitRegisterSVB: Store the operands for floating-point addition.

FloatingPointAdd: Computes the floating-point sum of the operands.

NbitRegisterSVC: Stores the result of the floating-point addition.

LCD: Displays the inputs, operation, and result on the LCD screen.
