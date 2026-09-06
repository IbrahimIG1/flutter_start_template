---
name: flutter-architecture
description: Flutter and Cubit architecture guidance for feature structure, responsibility boundaries, and UI organization. Use when designing or refactoring screens, Cubits, repositories, states, or feature folder structure in Flutter projects that value readability and maintainability.
---

# Flutter Architecture

## Core Principles
- Prefer maintainability over cleverness.
- Follow the existing project architecture before introducing new patterns.
- Introduce abstractions only when they solve a real maintenance problem.
- Do not create extra Cubits, repositories, widgets, helpers, or classes unless readability or responsibility boundaries clearly improve.

## Widget Architecture
- Use `StatelessWidget` by default.
- Use `StatefulWidget` only when lifecycle or local widget state truly requires it.
- If state comes from Cubit, keep the screen stateless.
- Split large screens into logical UI sections.
- Extract by responsibility, not by tiny widget fragments.

## Cubit Architecture
- Keep mutable variables inside the Cubit when appropriate.
- Let state primarily represent UI state.
- Expose `static CubitName get(BuildContext context)` in every Cubit.
- Prefer `Cubit.get(context)` over `context.read()` unless there is a strong reason not to.
- Keep Cubits focused on one UI flow or feature concern.
- Avoid unrelated responsibilities inside one Cubit.
- Cubits should mainly call repositories, prepare UI state, and emit states.

## Repository Architecture
- Keep repositories responsible only for data access.
- Do not move presentation logic into repositories.
- Keep API mapping and fetch/update responsibilities predictable.

## Feature Structure
- Organize widgets by feature responsibility.
- Extract sections like header, filters, body, actions, summary when that improves navigation.
- Keep file purpose obvious within a few seconds.

## Decision Test
Before introducing a new class, widget, helper, or abstraction ask:
- Does this improve readability?
- Does this reduce future maintenance cost?
- Will another Flutter developer understand it quickly?

If the answer is unclear, keep the simpler design.
