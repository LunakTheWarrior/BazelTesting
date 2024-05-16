import os
import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="modifies source file")
    parser.add_argument("file", help="The file to modify")
    parser.add_argument("output", "The place to put the file")
    args = parser.parse_args()

    