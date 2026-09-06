# Refactor Prompt

Use this prompt when the task is to improve code without changing behavior.

## Goal
Improve maintainability and readability while preserving:
- behavior
- UI
- Cubit logic
- Cubit integration
- repository contracts
- API contracts

## Workflow
1. Analyze first.
2. Decide whether refactoring is actually justified.
3. If the current code is already maintainable, recommend no change.
4. If refactoring is justified, keep the change set narrow.
5. Remove dead code and unused imports only when safe.
6. Remove duplicated code only when the result is genuinely clearer.
7. Remove unused widgets only when safe.
8. Split large widgets only when navigation or readability improves.
9. Do not refactor only to reduce line count.
10. Update documentation if feature understanding changed.

## Use With Skills
- Use `flutter-architecture` for screen/widget/Cubit structure.
- Use `flutter-code-style` for readability-level changes.
- Use `documentation` if the feature README becomes outdated.

## Output Format
Before implementation provide:
- Current Assessment
- Problems Worth Fixing
- Refactor Plan
- Expected Benefit
- Risk Level

After implementation provide:
- What Changed
- What Stayed Unchanged
- Why This Refactor Was Worth Doing
- Validation Performed

## Rules
- Prefer logical organization over artificial modularization.
- Keep code easy to modify later.
- Every refactor must have a measurable benefit.
