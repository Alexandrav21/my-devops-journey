#!/bin/bash

# ----------------------------------------------------
# Challenge 1 - Basic Arithmetic Calculator
# This script asks the user for two numbers and
# performs the four basic arithmetic operations.
# It also checks for division by zero.
# ----------------------------------------------------

# Ask the user to enter the first number
echo "Enter the first number:"
read num1

# Ask the user to enter the second number
echo "Enter the second number:"
read num2

# Perform the arithmetic operations
addition=$((num1 + num2))
subtraction=$((num1 - num2))
multiplication=$((num1 * num2))

# Display the results
echo
echo "Results:"
echo "$num1 + $num2 = $addition"
echo "$num1 - $num2 = $subtraction"
echo "$num1 * $num2 = $multiplication"

# Check that the second number is not zero
# before attempting division
if [ "$num2" -ne 0 ]
then
    division=$((num1 / num2))
    echo "$num1 / $num2 = $division"
else
    echo "Division cannot be performed because the second number is zero."
fi