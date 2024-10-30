# base_class.py
class BaseProcessor:
    def process_input(self, input_data: str) -> str:
        """
        Process a single line of input (as a string) and return the processed result as a string.
        Participants must implement this method.
        """
        raise NotImplementedError("Subclasses should implement this method.")
