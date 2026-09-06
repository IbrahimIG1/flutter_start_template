---
name: flutter-code-style
description: Flutter coding style guidance for readable implementation details. Use when writing or refactoring Dart and Flutter code to keep methods, widget trees, naming, and control flow easy to understand for another Flutter developer.
---

# Flutter Code Style

## Goal
Keep code easy to scan, easy to modify, and easy to understand quickly.

## General Rules
- Prefer readable code over compact code.
- Use descriptive names.
- Avoid abbreviations when the full name is clearer.
- Use `const` whenever it improves clarity and is practical.
- Avoid magic numbers when a named value would explain intent.

## Method Style
- Keep methods focused.
- Prefer early return over deep nesting.
- Group related methods together.
- Keep public methods above private methods.
- Avoid unnecessary helper methods.
- Avoid giant methods when they are hard to navigate.
- Extract methods only when they are reused, difficult to read inline, or can be given a meaningful name.

## Control Flow
- Avoid deep condition chains when a simpler expression is clearer.
- Prefer flat control flow over stacked nesting.
- Prefer clear `fold`-style result handling over large nested success/error branches when that matches the project pattern.

## Widget Code Style
- Keep `build()` methods easy to scan.
- Avoid deeply nested widget trees when structure can be clarified.
- Add comments only for meaningful UI sections or non-obvious logic.
- Do not create comments for trivial code.

## Simplicity Rules
- Avoid unnecessary wrappers.
- Avoid unnecessary utility classes.
- Avoid abstraction that only reduces line count.
- If code is simple and used once, keep it local.

## Decision Test
Before extracting code ask:
- Does the extraction improve readability?
- Does it reduce cognitive load?
- Will it be easier to modify later?

If not, keep the simpler version.
