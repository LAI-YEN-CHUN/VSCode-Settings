---
description: "Python coding conventions and guidelines (modern best practices)"
applyTo: "**/*.py, **/*.ipynb"
---

# Python Coding Conventions

These guidelines reflect **current Python best practices (Python 3.9+)** with an emphasis on readability, correctness, maintainability, and testability.

---

## Python Instructions

- Write **clear, concise, and purposeful comments**. Comments should explain _why_ something is done, not restate _what_ the code already makes obvious.
- Ensure all functions and methods have **descriptive, intention-revealing names**.
- Use **type hints everywhere** (function arguments, return types, and important variables).
- Prefer **built-in generic types** introduced in Python 3.9+:
  - Use `list[str]`, `dict[str, int]`, `set[int]` instead of `List[str]`, `Dict[str, int]` unless required for backward compatibility.
- Provide **docstrings that follow PEP 257**, written in complete sentences.
- Keep functions **small and single-purpose**. If a function becomes complex, refactor it into smaller composable functions.

---

## Documentation and Docstrings

- Every public function, method, class, and module **must have a docstring**.
- Docstrings should describe:
  - What the function does
  - Its parameters (including expected types and constraints)
  - Return values
  - Raised exceptions (if any)
- Use a consistent docstring style (Google or NumPy style is acceptable; be consistent across the project).

Example:

```python
def calculate_area(radius: float) -> float:
    """
    Calculate the area of a circle.

    Args:
        radius (float): Radius of the circle. Must be non-negative.

    Returns:
        float: Area of the circle (π × radius²).

    Raises:
        ValueError: If radius is negative.
    """
    import math

    if radius < 0:
        raise ValueError("radius must be non-negative")

    return math.pi * radius ** 2
```

---

## General Best Practices

- **Readability over cleverness**. Prefer explicit code over implicit or overly compact constructs.
- Follow the **principle of least surprise**: code behavior should be predictable.
- Use **standard library modules** whenever possible instead of third-party dependencies.
- Prefer:
  - `pathlib` over `os.path`
  - `logging` over `print`
  - `dataclasses` for simple data containers
- Avoid premature optimization; optimize only after measuring performance.
- Document **design decisions** when the reasoning is non-obvious or when trade-offs are made.

---

## Error Handling and Edge Cases

- Validate inputs early and fail fast with **clear, specific exceptions**.
- Never silently ignore exceptions.
- Catch exceptions only when you can handle them meaningfully.
- Document edge cases explicitly, including:
  - Empty inputs
  - Invalid data types
  - Boundary values
  - Large datasets

Example:

```python
if not items:
    # Edge case: empty input returns zero by definition
    return 0
```

---

## Code Style and Formatting

- All formatting and linting are enforced automatically via tooling (e.g. ruff).
- Code reviews should focus on logic, correctness, and design — not formatting.

---

## Testing Guidelines

- Write **unit tests for all critical logic paths**.
- Tests should be:
  - Deterministic
  - Isolated
  - Easy to understand
- Prefer `pytest` for its readability and ecosystem.
- Each test function must have a docstring explaining:
  - What is being tested
  - The scenario or edge case covered

Example:

```python
def test_calculate_area_zero_radius():
    """Verify that a zero radius returns an area of 0."""
    assert calculate_area(0.0) == 0.0
```

---

## Dependency Management

- Clearly document third-party dependencies and their purpose.
- Pin dependency versions for reproducibility.
- Avoid unnecessary dependencies; each dependency should have a clear justification.

---

## Maintainability Checklist

- Code is easy to read without additional explanation
- Functions are short and focused
- Naming is consistent and unambiguous
- Edge cases are handled and documented
- Types are explicit and accurate
- Tests cover expected and failure scenarios

Adhering to these conventions ensures Python codebases that are robust, maintainable, and aligned with modern industry standards.
