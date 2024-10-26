#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: ./gencsv.sh <start_index> <end_index>"
    exit 1
fi

# Assign input arguments to variables
start_index=$1
end_index=$2

# Check if start_index is less than or equal to end_index
if [ "$start_index" -gt "$end_index" ]; then
    echo "Start index should be less than or equal to end index."
    exit 1
fi

# Generate the inputFile with index and random number pairs
output_file="inputFile"
> "$output_file"  # Clear the file if it already exists

for (( i=start_index; i<=end_index; i++ ))
do
    random_number=$(( RANDOM % 1000 ))  # Generate a random number between 0 and 999
    echo "$i, $random_number" >> "$output_file"
done

echo "File '$output_file' generated successfully."
