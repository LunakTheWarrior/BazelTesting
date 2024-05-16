import unittest
import subprocess
import os


class TestCProgram(unittest.TestCase):
    def test_output(self):
        expected = """Character is: 97 
Character is: 98 
Character is: 99 
Character is: 10 
Character is: 0 
"""
        actual  = subprocess.run(["c/test/string_app"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        self.assertEqual(expected, actual.stdout)


if __name__ == "__main__":
    unittest.main()