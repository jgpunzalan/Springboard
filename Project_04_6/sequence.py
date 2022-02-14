DATA_FOLDER = "data/"
SEQUENCE_FILE = "sequence_file.txt"

class SequenceGenerator:
    """Generator to create unique incrementing sequence numbers."""
    
    @staticmethod
    def next_val():
        """Returns next value to be used in sequence from file and increments"""
        with open(DATA_FOLDER + SEQUENCE_FILE, "r+") as data_file:
            seq = int(data_file.readline())
            data_file.seek(0)
            data_file.write(str(seq + 1))
        return seq