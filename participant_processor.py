# participant_processor.py
from base_class import BaseProcessor

class ParticipantProcessor(BaseProcessor):
    def process_input(self, input_data: str) -> str:
        # Example: Convert the input data to uppercase
        return input_data.upper()
