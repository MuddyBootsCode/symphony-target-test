"""Pagination helper. Has a deliberate off-by-one bug for symphony to fix."""

from __future__ import annotations


def paginate(items: list, page: int, size: int) -> list:
    """Return the slice of items for the given 1-indexed page.

    page=1 returns the first `size` items.
    page=2 returns items size..2*size-1, etc.
    """
    if page < 1:
        raise ValueError("page must be >= 1")
    if size < 1:
        raise ValueError("size must be >= 1")
    start = (page - 1) * size
    end = page * size
    return items[start:end]
