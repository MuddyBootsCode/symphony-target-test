"""Tests for paginator.paginate. The first test currently FAILS because of the off-by-one bug."""

import sys
import unittest
from pathlib import Path

# Make src/ importable without a package install.
sys.path.insert(0, str(Path(__file__).parent.parent / "src"))

from paginator import paginate  # noqa: E402


class PaginateTests(unittest.TestCase):
    def test_first_page_returns_full_size(self):
        # page=1, size=5 against 10 items should return [0..4].
        # Current bug returns [0..3] (drops the last item).
        items = list(range(10))
        self.assertEqual(paginate(items, page=1, size=5), [0, 1, 2, 3, 4])

    def test_second_page_returns_full_size(self):
        items = list(range(10))
        self.assertEqual(paginate(items, page=2, size=5), [5, 6, 7, 8, 9])

    def test_partial_last_page(self):
        items = list(range(7))
        self.assertEqual(paginate(items, page=2, size=5), [5, 6])

    def test_invalid_page_raises(self):
        with self.assertRaises(ValueError):
            paginate([1, 2], page=0, size=1)

    def test_invalid_size_raises(self):
        with self.assertRaises(ValueError):
            paginate([1, 2], page=1, size=0)


if __name__ == "__main__":
    unittest.main()
