#!/usr/bin/env python3
import unittest
from src.kode import the_code_to_test


class TestKode(unittest.TestCase):
    def test_canary(self):
        self.assertEqual(1,1)

    def test_externalcode(self):
        self.assertEqual(the_code_to_test(), 42)


if __name__ == "__main__":
    unittest.main()