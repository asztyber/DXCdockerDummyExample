# evaluation_script.py
import sys
from participant_processor import ParticipantProcessor
import tensorflow as tf

def evaluate(input_file: str, output_file: str):
    processor = ParticipantProcessor()

    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        for line in infile:
            result = processor.process_input(line.strip())
            outfile.write(result + '\n')

if __name__ == "__main__":
    # Check GPU


    # Check if TensorFlow can access a GPU
    if tf.config.list_physical_devices('GPU'):
        print("GPU is available.")
    else:
        print("GPU is not available.")

    
    # Specify input and output files
    input_file = sys.argv[1]  # first argument: input file
    output_file = sys.argv[2]  # second argument: output file

    evaluate(input_file, output_file)
